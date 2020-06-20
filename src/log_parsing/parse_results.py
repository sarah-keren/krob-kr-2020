import sys, os
import parsing_constants

BUDGET_ARR = {0, 1, 2}
HEURISTICS = {'db', 'multi_db', 'zero'}
# insert a value into dynamically sized list
def insert(d, key_list, val):
    if len(key_list) == 1:
        d[key_list[0]] = val 
        return 
    if not d.get(key_list[0]):
        d[key_list[0]] = {}
    insert(d[key_list[0]], key_list[1:], val)

def get_values_from_params(wanted_params, all_params, separator):
    key_list = []
    for param in wanted_params:
        value = list(filter(lambda x: param + separator in x, all_params))
        # error handling: if value not found, replace w/ error
        if len(value) == 0:
            print(value, param, wanted_params, all_params)
            value = param+'_error'
        else:
            _, value = value[0].strip(parsing_constants.NEW_LINE).split(separator)
        key_list.append(value)

    return key_list

# returns true if the line contains a record keyword
def containsRecords(line):
    if parsing_constants.NEW_RESULTS_DELIMINATOR in line:
        return True

    for keyword in parsing_constants.RECORD_KEYWORDS:
        if keyword in line:
            return True 
    return False

def parse_results(design_results_file_name):
    
    results_file = open(design_results_file_name)
    results_map = {}
    total_results_map = {}

    lines = results_file.readlines()
    line_index = 1

    while line_index < len(lines):
        
        if parsing_constants.NEW_RESULTS_DELIMINATOR in lines[line_index]:
                line_index += 1

                # parse all keys::value in parameters
                all_params = []

                while line_index < len(lines) and not containsRecords(lines[line_index]):
                    if line_index >= len(lines):
                        break
                    all_params.append(lines[line_index])
                    line_index += 1
                # parse the values for keys::value desired
                key_list = get_values_from_params \
                    (parsing_constants.STRUCTURE, all_params, parsing_constants.KEY_VAL_SEPARATOR)

                for index, record_keyword in enumerate(parsing_constants.RECORD_KEYWORDS):
                    cur_line = ''
                    
                    if parsing_constants.INDEX_TO_REPLACE:
                        key_list[parsing_constants.INDEX_TO_REPLACE] = index


                    if line_index < len(lines):
                        cur_line = lines[line_index]

                    if record_keyword in cur_line:
                        records_line = lines[line_index].split(parsing_constants.INLINE_RECORD_SEPARATOR)
                        records_to_insert = \
                            get_values_from_params(parsing_constants.RECORDS, records_line, parsing_constants.KEY_VAL_SEPARATOR)
                        insert(results_map, key_list, records_to_insert)
                        line_index += 1
                    else:
                        records_to_insert = parsing_constants.DEFAULT_VALUES
                        insert(results_map, key_list, records_to_insert)

                if parsing_constants.TOTAL_KEYWORD in lines[line_index]:
                    records_line = lines[line_index].split(parsing_constants.INLINE_RECORD_SEPARATOR)
                    key_list = get_values_from_params \
                        (parsing_constants.TOTAL_KEYLIST, all_params, parsing_constants.KEY_VAL_SEPARATOR)
                    records_to_insert = \
                        get_values_from_params(parsing_constants.TOTAL_RECORDS, records_line, parsing_constants.TOTAL_KEY_VAL_SEP)

                    insert(total_results_map, key_list, records_to_insert) 


        if line_index >= len(lines):
            break              
        if parsing_constants.NEW_RESULTS_DELIMINATOR in lines[line_index]:
            continue    

        line_index += 1
    return results_map, total_results_map

def average(lst, record_label):
    if not "average wcd reduction" in record_label:
        lst = [e for e in lst if e != 0]
    if len(lst) == 0:
        return 0
    return float(sum(lst)) / float(len(lst))


def wcd_greater_than_0(cur_total_results, pruning, heuristic, problem):
    # [UPDATE] If best wcd is 0 for this pruning, heuristic & budget of the problem, return false
    # if cur_problem_results[planner][compilation][pruning][heuristic][budget][0] == '0':
    #     return False
    if float(cur_total_results[planner][compilation][pruning][heuristic][0]) == 0 :
        return False
    return True

def findDelta(results_over_all_budgets, best_value, budget):
    # wcd is at index of 0; use total best value as min reference point
    results = results_over_all_budgets.values()
    wcds = list(map(lambda x: int(x[0]), results))
    return wcds[0] - wcds[budget]

def completed_by_all_approaches(cur_total_results):
    # return true if ex_terminated is false for all 6 pruning heuristic combinations
    for planner in parsing_constants.PLANNERS:
        for compilation in parsing_constants.COMPILATIONS:
            for pruning in parsing_constants.PRUNING:
                for heuristic in parsing_constants.HEURISTICS:

                    if cur_total_results[planner][compilation][pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'True':
                        return False 
                    # if 'error' in cur_total_results[planner][compilation][pruning][heuristic][0]:
                    #      # 0 is the index of the current value in cur_total_results, error means 88888 was reported
                    #     return False
                    if float(cur_total_results[planner][compilation][pruning][heuristic][4]) > parsing_constants.TIMEOUT_BOUND:
                        return False


                    

    return True

def all_zero(problem_results):
    for i in range(2):
        if problem_results[i] != 0:
            return False
    return True


def completed_by_previous(problem_results, budget):
    if not all_zero(problem_results[budget]):
        return True
    # Check if the approach has been completed by any budgets previous
    for i in range(budget):
        if not all_zero(problem_results[i]):
            return True 

    return False

def analyze_results_updated(results_map, total_results_map, args): 
    table_results = {}

    for planner in parsing_constants.PLANNERS:
        table_results[planner] = {}

        for compilation in parsing_constants.COMPILATIONS:
            table_results[planner][compilation] = {}

            for pruning in parsing_constants.PRUNING:
                table_results[planner][compilation][pruning] = {}
            
                for heuristic in parsing_constants.HEURISTICS: 
                    table_results[planner][compilation][pruning][heuristic] = {}

                    for budget in parsing_constants.BUDGETS:
                        table_results[planner][compilation][pruning][heuristic][budget] = {}

                        for i, record in enumerate(parsing_constants.AVERAGES_TO_COMPUTE): # for each value to compute (time, explored, wcd reduction)
                            sol = 0

                            results_for_record = []
                            index_of_record = None

                            if record == 'wcd_reduction': # this is where to find the value in the results_map
                                index_of_record = 2
                            else:
                                index_of_record = parsing_constants.TOTAL_RECORDS.index(record)

                            for index, flag in enumerate(parsing_constants.FLAGS):          
                                num_problems = 0

                                results_for_record = []
                                record_label = parsing_constants.RESPECTIVE_LABELS[i]
                                flag_label = ''

                                if index >= 0:
                                    record_label += parsing_constants.FLAG_LABELS[index]

                                for problem in results_map:   # for each problem
                                    b_list = {0, 1} if budget == 1 else {0, 1, 2}
                                    for b_to_compute in b_list: # b_to_compute means include budgets up to this point (e.g. for 1, compute over 0 and 1)
                                        num_problems += 1
                                        cur_problem_results = results_map[problem]
                                        cur_total_results = total_results_map[problem]

                                        if flag == 'ex_terminated':
                                            if budget == 0:
                                                if cur_total_results[planner][compilation][pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'False' \
                                                and float(cur_total_results[planner][compilation][pruning][heuristic][4]) < parsing_constants.TIMEOUT_BOUND:
                                                    sol += 1

                                            elif budget == 1:
                                                if completed_by_previous(cur_problem_results[planner][compilation][pruning][heuristic], budget):
                                                    if all_zero(cur_problem_results[planner][compilation][pruning][heuristic][2]):
                                                        if cur_total_results[planner][compilation][pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'False':
                                                            sol += 1
                                                    else:
                                                        sol += 1
                                            elif budget == 2:
                                                if completed_by_previous(cur_problem_results[planner][compilation][pruning][heuristic], budget) and \
                                                    cur_total_results[planner][compilation][pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'False':
                                                    sol += 1
                                            
                                        
                                        result = None 
                                        if not completed_by_all_approaches(cur_total_results) and flag != 'compute_all':
                                            continue
                                        
                                        if record == 'wcd_reduction':
                                            result = findDelta(cur_problem_results[planner][compilation][pruning][heuristic], cur_total_results[planner][compilation][pruning][heuristic][0], b_to_compute)
                                            if all_zero(cur_problem_results[planner][compilation][pruning][heuristic][b_to_compute]):
                                                if b_to_compute == 2 and not all_zero(cur_problem_results[planner][compilation][pruning][heuristic][1]): # for b = 2 find differential b/w 1 and 2
                                                    result = findDelta(cur_problem_results[planner][compilation][pruning][heuristic], cur_total_results[planner][compilation][pruning][heuristic][0], 1)
                                                else:
                                                    continue
                                                    
                                            if b_to_compute == 0: # do not include 0 when calculating wcd reduction
                                                continue

                                        else:
                                            if record == 'time':
                                                index_of_record = 1
                                            elif record == 'explored':
                                                index_of_record = 2
                                            result = float(cur_problem_results[planner][compilation][pruning][heuristic][b_to_compute][index_of_record])

                                        results_for_record.append(result)

                                table_results[planner][compilation][pruning][heuristic][budget][record_label] = average(results_for_record, record_label)
                                
                                if flag == 'ex_terminated':
                                    table_results[planner][compilation][pruning][heuristic][budget]['sol'] = float(sol) / num_problems

    print(table_results)
    for planner in table_results:
        for compilation in table_results[planner]:
            print('+ - - - - - - - - - - - - - - - - - - - - +')
            print('+------%s/%s------+' % (planner, compilation))
            for pruning in table_results[planner][compilation]:
                print("pruning: %s" % pruning)
                for heuristic in table_results[planner][compilation][pruning]:
                    print("heuristic: %s" % heuristic)
                    print('+ - - - - - - - - - - - - - - - - - - - - +')
                    for budget in table_results[planner][compilation][pruning][heuristic]:
                        print('+ - - - - +')
                        print('budget: %s' % budget)
                        print('+ - - - - +')
                        results = table_results[planner][compilation][pruning][heuristic][budget]
                        for key in results:
                            val = results[key] 
                            print("%s :: %f" % (key, val))

    ''' Tex Format:
                           NA                           CG
        budget sol wcd (over all) time nodes sol wcd (overall) time nodes
    '''         
    # tex = ''
    # for budget in range(1,3):
    #     tex += '\n' + str(budget) + ' '
    #     for pruning in parsing_constants.PRUNING:
    #         for key in ['sol', 'average wcd reduction', 'average time', 'average nodes evaluated']:
    #             if key == 'average wcd reduction':
    #                 tex += '& %s(%s) ' % ((round(table_results[planner][compilation][pruning]['NA'][budget][key], 2)), \
    #                     round(table_results[planner][compilation][pruning]['NA'][budget]['average wcd reduction for all'], 2))
    #             else:
    #                 tex += '& %s ' % (round(table_results[planner][compilation][pruning]['NA'][budget][key], 2))
    
    # print(tex)

def main(args):
    results_path = args.path 
    results_map, total_results_map = parse_results(results_path)
    analyze_results_updated(results_map, total_results_map, args)
    

# if __name__ == '__main__':
#     # $1 - path to design log results
#     results_path = sys.argv[1] # python3 code/result_parser.py ./logs/log/design_log_results.txt

# TODO CONFIRM THAT THE FILES HAVE THE SAME PROBLEMS IN THEM