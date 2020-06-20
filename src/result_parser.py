import sys, os
import parsing_constants

BUDGET_ARR = {0, 1, 2}
HEURISTICS = {'db', 'multi_db', 'zero', 'NA'}
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
    # print(total_results_map)
    return results_map, total_results_map

def average(lst, record_label):
    if len(lst) == 0:
        return 0
    return float(sum(lst)) / float(len(lst))


def wcd_greater_than_0(cur_total_results, pruning, heuristic, problem):
    '''
    if best wcd is 0 for any heuristic of the problem, return false
    for pruning in cur_total_results:
        for heuristic in cur_total_results[pruning]:
            if float(cur_total_results[pruning][heuristic][parsing_constants.INDEX_OF_TOTAL_BEST_VALUE]) == 0:
                return False
    '''
    # [UPDATE] If best wcd is 0 for this pruning, heuristic & budget of the problem, return false
    # if cur_problem_results[pruning][heuristic][budget][0] == '0':
    #     return False
    if float(cur_total_results[pruning][heuristic][0]) == 0 :
        return False
    return True

def findDelta(results_over_all_budgets, best_value):
    # wcd is at index of 0; use total best value as min reference point
    results = results_over_all_budgets.values()
    wcds = list(map(lambda x: int(x[0]), results))
    return max(wcds) - float(best_value)

def completed_by_all_approaches(cur_total_results):
    # return true if ex_terminated is false for all 6 pruning heuristic combinations
    for pruning in parsing_constants.PRUNING:
        for heuristic in parsing_constants.HEURISTICS:
            if cur_total_results[pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'True':
                return False 
    return True


def analyze_ijcai_results(results_map, total_results_map):
    table_results = {}

    for pruning in parsing_constants.PRUNING:
        table_results[pruning] = {}
        for heuristic in parsing_constants.HEURISTICS:
            table_results[pruning][heuristic] = {}
            num_problems = 0
            for i, record in enumerate(parsing_constants.AVERAGES_TO_COMPUTE):
                sol = 0

                results_for_record = []
                index_of_record = None

                if record == 'wcd_reduction':
                    index_of_record = 2
                else:
                    index_of_record = parsing_constants.TOTAL_RECORDS.index(record)

                for index, flag in enumerate(parsing_constants.FLAGS):

                    results_for_record = []
                    record_label = parsing_constants.RESPECTIVE_LABELS[i]
                    flag_label = ''
                    if index == 1:
                        record_label += parsing_constants.FLAG_LABELS[index]

                    for problem in results_map:
                        num_problems += 1
                        cur_problem_results = results_map[problem]
                        cur_total_results = total_results_map[problem]

                        if flag == 'ex_terminated' and cur_total_results[pruning][heuristic][parsing_constants.INDEX_OF_FLAG_IN_RESULTS] == 'False':
                            sol += 1

                        result = None
                        if not completed_by_all_approaches(cur_total_results):
                            continue

                        if flag == 'wcd_greater_than_0':
                            if not wcd_greater_than_0(cur_total_results,pruning,heuristic, problem):
                                continue

                        if record == 'wcd_reduction':
                            result = findDelta(cur_problem_results[pruning][heuristic], cur_total_results[pruning][heuristic][0])
                        else:
                            result = float(cur_total_results[pruning][heuristic][index_of_record])
                        
                        results_for_record.append(result)
                # print(pruning, heuristic,record, ':', results_for_record)
                    
                    if flag == 'wcd_greater_than_0':
                        table_results[pruning][heuristic]['percentage' + parsing_constants.FLAG_LABELS[index]] = len(results_for_record) / len(results_map)
                    table_results[pruning][heuristic][record_label] = average(results_for_record, record_label)
                    if flag == 'ex_terminated':
                        table_results[pruning][heuristic]['sol'] = float(sol) / len(results_map)
    for pruning in table_results:
        print('+ - - - - - - - - - - - - - - - - - - - - +')

        print('+----pruning:: %s------+' % pruning)
        for heuristic in table_results[pruning]:
            print('+ - - - - - - - - - - - - - - - - - - - - +')
            print("heuristic:: %s" % heuristic)
            print('+ - - - - - - - - - - - - - - - - - - - - +')
            # print("ratio solved:: %d/%d" % (float(table_results[pruning][heuristic]['sol']), \
            #     float(table_results[pruning][heuristic][budget]['number of problems'])))
            results = table_results[pruning][heuristic]
            for key in results:
                val = results[key]
                print('%s :: %f' % (key, val))


def analyze_results(results_map, total_results_map):
    # print(results_map)
    table_results = {}
    # print(results_map)
    # print('\n\n\n')
    # print(total_results_map)

    for pruning in parsing_constants.PRUNING:
    # compute across all results
        table_results[pruning] = {}
        for heuristic in parsing_constants.HEURISTICS:
            table_results[pruning][heuristic] = {}
            
            for budget in parsing_constants.BUDGETS:
                table_results[pruning][heuristic][budget] = {}

                for record in parsing_constants.AVERAGES_TO_COMPUTE:
                    results_for_record = []

                    index_of_record = None
                    if record == 'wcd_reduction':
                        index_of_record = 3
                    elif record == 'Total_best_value':
                        index_of_record = 4
                    else:
                        index_of_record = parsing_constants.RECORDS.index(record)
                
                    record_label = parsing_constants.RESPECTIVE_LABELS[index_of_record]

                    for problem in results_map:

                        cur_problem_results = results_map[problem]
                        cur_total_results = total_results_map[problem]

                        # print(problem)
                        result = None
                            
                        if record == 'wcd_reduction':
                            result = findDelta(cur_problem_results[pruning][heuristic])
                        elif record == 'Total_best_value':
                            result = float(cur_total_results[pruning][heuristic][0])
                        else:
                            result = float(cur_problem_results[pruning][heuristic][budget][index_of_record])

                        results_for_record.append(result)
                    
                    table_results[pruning][heuristic][budget]['number of problems'] = len(results_for_record)
                    table_results[pruning][heuristic][budget][record_label] = average(results_for_record, record_label)

    # TODO: see if can extract into a function
    # handle completed
    if parsing_constants.FLAGS:
        for pruning in parsing_constants.PRUNING:
            for heuristic in parsing_constants.HEURISTICS:
                for budget in parsing_constants.BUDGETS:
                    for record in parsing_constants.AVERAGES_TO_COMPUTE:

                        index_of_record = None
                        if record == 'wcd_reduction':
                            index_of_record = 3
                        elif record == 'Total_best_value':
                            index_of_record = 4
                        else:
                            index_of_record = parsing_constants.RECORDS.index(record)

                        for index, flag in enumerate(parsing_constants.FLAGS):
                            results_for_record = []

                            record_label = parsing_constants.RESPECTIVE_LABELS[index_of_record]
                            record_label += parsing_constants.FLAG_LABELS[index]

                            for problem in results_map:
                                
                                cur_problem_results = results_map[problem]
                                # print(cur_problem_results)
                                cur_total_results = total_results_map[problem]

                                # This is where configurable functions based on flag go
                                if flag == 'ex_terminated' and not completed_by_all_approaches(cur_total_results):
                                    continue
                                # handle wcd > 0
                                if flag == 'wcd_greater_than_0':
                                    if not wcd_greater_than_0(cur_total_results,pruning,heuristic,budget,problem):
                                        continue
                                result = None
                                if record == 'wcd_reduction':
                                    result = findDelta(cur_problem_results[pruning][heuristic])
                                elif record == 'Total_best_value':
                                    result = float(cur_total_results[pruning][heuristic][0])
                                else:
                                    result = float(cur_problem_results[pruning][heuristic][budget][index_of_record])
                                results_for_record.append(result)

                            table_results[pruning][heuristic][budget]['number of problems' + parsing_constants.FLAG_LABELS[index]] = len(results_for_record)
                            table_results[pruning][heuristic][budget][record_label] = average(results_for_record, record_label)       

    # display the results
    # TODO: think about generalizing the printing
    # print(cur_total_results)
    for pruning in table_results:
        print('+----pruning:: %s------+' % pruning)
        for heuristic in table_results[pruning]:
            print('+ - - - - - - - - - - - - - - - - - - - - +')
            print("heuristic:: %s" % heuristic)
            print('+ - - - - - - - - - - - - - - - - - - - - +')
            for budget in table_results[pruning][heuristic]:

                print('+ - - - - - - +')
                print('budget:: %d'% budget)
                print('+ - - - - - - +')
                print("ratio solved:: %d/%d" % (float(table_results[pruning][heuristic][budget]['number of problems for completed']), \
                    float(table_results[pruning][heuristic][budget]['number of problems'])))
                results = table_results[pruning][heuristic][budget]
                for key in results:
                    val = results[key]
                    print('%s :: %f' % (key, val))

def get_initial_wcd_avg(results_map):
    print("average initial")
    total_init_wcd = 0
    count = 0
    for entry in results_map:
        print(entry)
        current_wcd = int(results_map[entry]['NA']['NA'][0][0])
        total_init_wcd = total_init_wcd+current_wcd
        count +=1
    return total_init_wcd/count

if __name__ == '__main__':
    # $1 - path to design log results
    results_path = sys.argv[1] # python3 code/result_parser.py ./logs/log/design_log_results.txt

    results_map, total_results_map = parse_results(results_path)
    print(total_results_map)
    print(get_initial_wcd_avg(results_map))
    # print(results_map)
    # print(results_map)
    # # print('=================================')
    # print(total_results_map)
    # # print('=================================')
    #analyze_results(results_map, total_results_map)
    #analyze_ijcai_results(results_map, total_results_map)
