from collections import defaultdict
import analytics_constants, parsing_constants, pprint

class ParseAnalytics:

    def __init__(self, path):
        self.path = path
        self.dict = {} # { instance ID: {index: { node ID : { PO Cost: {has sol: number_planner_calls}, FO Cost: y, }}}}

    def print_results(self):
        print(self.dict)

    def get_values_from_params(self, wanted_params, all_params, separators):
        key_list = []
        for param in wanted_params:
            value = []
            for separator in separators:
                if not value:
                    value = list(filter(lambda x: param + separator in x, all_params))
            
            # error handling: if value not found, replace w/ error
            if len(value) == 0:
                value = param+'_error'
            else:
                value = value[0].strip(parsing_constants.NEW_LINE)
                if ':' in value:
                    _, value = value.split(':')
                else:
                    _, value = value.split('=')
            key_list.append((param, value))

        return key_list

    def get_val(self, keyval):
        key, val = keyval.split(':',1)
        return val 

    def get_node(self, line):
        _, node = line.strip('\n').split('(node) ')

        if 'cur_node' in node:
            idx_hval = node.index('>hval')
            string = self.insert_space(node, idx_hval+1).split(" ")
            _, val = self.get_values_from_params(['cur_node'], string, [':'])[0]
            node = val.replace("<","").replace(">","")
        return node 

    def insert_space(self, string, integer): # handle hval logging
        return string[0:integer] + ' ' + string[integer:]

    def insert(self, d, key_list, val):
        if len(key_list) == 1:
            d[key_list[0]] = val 
            return 
        if not d.get(key_list[0]):
            d[key_list[0]] = {}
        self.insert(d[key_list[0]], key_list[1:], val)

    def get_instance_values(self, data):
        idxs = [i for i, elem in enumerate(data) if any(e in elem for e in analytics_constants.METADATA)]
        vals = [self.get_val(data[i]) for i in idxs]
        # TODO: add ordering functionality specified in constants
        # for now hard code
        vals = [vals[0], vals[3], vals[2], vals[1]]
        return vals

    def process_logs(self):
        # read over lines; construct key list and insert results accordingly
        analytics_file = open(self.path)
        analytics_map = {}

        lines = analytics_file.readlines()
        line_index = 0
        
        while line_index < len(lines):
            if 'instance_id' in lines[line_index]:
                data = lines[line_index].split()
                instance_key_list = self.get_instance_values(data)

                line_index += 1

            if 'Starting: best_first_design' in lines[line_index]:
                line_index += 1

            while 'Ending' not in lines[line_index]:
                if 'node number' in lines[line_index]:
                    node = self.get_node(lines[line_index])
                    curr_node_key_list = instance_key_list + [node]
                    line_index += 1

                if 'PO_cost' in lines[line_index]:
                    setting = 'PO'
                    _, index = lines[line_index].strip("\n").split('index:')
                    line_index += 1
                    if not 'InMethod solve' in lines[line_index]:
                        self.insert(self.dict, curr_node_key_list + [index, setting], 'error')
                        line_index += 1
                        continue

                    all_params = lines[line_index].split()[2:]
                    key_vals = self.get_values_from_params(analytics_constants.SOLVE_RECORDS, all_params, analytics_constants.KEY_VAL_SEP)
                    for (key, val) in key_vals:
                        key_list = curr_node_key_list + [index,setting,key]
                        self.insert(self.dict, key_list, val)
                    
                    line_index += 1

                if 'FO_cost' in lines[line_index]:
                    setting = 'FO'
                    _, index = lines[line_index].strip("\n").split('index:')
                    line_index += 1
                    if not 'InMethod solve' in lines[line_index]:
                        self.insert(self.dict, curr_node_key_list + [index, setting], {'error': 'error'})
                        line_index += 1
                        break

                    all_params = lines[line_index].split()[2:]
                    key_vals = self.get_values_from_params(analytics_constants.SOLVE_RECORDS, all_params, analytics_constants.KEY_VAL_SEP)
                    for (key, val) in key_vals:
                        key_list = curr_node_key_list + [index,setting,key]
                        self.insert(self.dict, key_list, val)
                    
                    line_index += 1

                if 'InMethod best_first_design' in lines[line_index]:
                    line = lines[line_index]
                    idx_hval = line.index('hval')
                    line = self.insert_space(line, idx_hval)
                    idx_hval = line.index('>hval')
                    line = self.insert_space(line, idx_hval+1)
                    all_params = line.split()[2:]
                    key_vals = self.get_values_from_params(analytics_constants.NODE_RECORDS, all_params, analytics_constants.KEY_VAL_SEP)

                    for (key, val) in key_vals:
                        key_list = curr_node_key_list + ['node results', key]
                        self.insert(self.dict, key_list, val)

                    line_index += 1

            if 'Ending' in lines[line_index]:
                line_index += 1
            else:
                line_index += 1

        self.clean_dictionary()
        
        return self.dict 


    def clean_dictionary(self):
        # remove commas from keys, turn values into booleans, floats, etc.

        def remove_commas(d):
            if isinstance(d, dict):
                return {k.replace(',', ''): remove_commas(v) for k, v in d.items()}
            else:
                return d.replace(',', '')
        
        cleaned = remove_commas(self.dict)
        # remove commas from keys, turn values into booleans, floats, etc.
        self.dict = {}
        self.dict.update(cleaned)
        return

    def completed_by_all_approaches(self, cur_problem_results, cur_node, hyps, setting):
        '''Check if the problem has a solution from all planners, compilations, etc.'''
        for planner in analytics_constants.PLANNERS:
            for compilation in analytics_constants.COMPILATIONS:
                for pruning in analytics_constants.PRUNING:
                    try:
                        node = cur_problem_results[planner][compilation][pruning][cur_node][hyps][setting]
                    except KeyError:
                        return False
                    if node['has_solution'] == 'False':
                        return False 
    
        return True

    def find_kprudent_success(self):
        print("find kprudent success")
        results_map = self.dict 

        for planner in analytics_constants.PLANNERS:
            for pruning in ['None']:
                for setting in ['PO']:
                    for problem in results_map:
                        cur_problem_results = results_map[problem]
                        print(problem, planner, pruning)
                        kp_nodes = cur_problem_results[planner]['kp'][pruning]
                        kprudent_nodes = cur_problem_results[planner]['kprudent'][pruning]

                        for i in kp_nodes:
                            for n in ['0','1']:
                                if not self.completed_by_all_approaches(cur_problem_results,i,n,'PO'):
                                    print("skip")
                                    break
                                kp_plan_len = float(kp_nodes[i][n]['PO']['plan_length'])
                                kprudent_plan_len = float(kprudent_nodes[i][n]['PO']['plan_length'])
                                if kp_nodes[i][n]['PO']['has_solution'] == 'True' and kprudent_nodes[i][n]['PO']['has_solution'] == 'True':
                                    if  kp_plan_len > kprudent_plan_len:
                                        print(problem, planner, i, n, (kp_plan_len, kprudent_plan_len))
                                        print('=======')
        
        return
                                

    def parse_results(self):
        # self.find_kprudent_success()
        # print("kprudent successes ^")
        def average(lst): 
            if not len(lst):
                return 0
            else:
                return float(sum(lst)) / float(len(lst))
            
        if not self.dict:
            print("process logs first")
            return 

        results_map = self.dict
        table_results = {}

        for planner in analytics_constants.PLANNERS:
            table_results[planner] = {}

            for compilation in analytics_constants.COMPILATIONS:
                table_results[planner][compilation] = {}

                for pruning in analytics_constants.PRUNING:
                    table_results[planner][compilation][pruning] = {}
                    for setting in ['PO','FO']:
                        for i, record in enumerate(analytics_constants.AVERAGES_TO_COMPUTE):
                            num_problems = 0
                            sol = 0
                            record_label = setting +'_' + analytics_constants.RESPECTIVE_LABELS[i]
                            results_for_record = []

                            for problem in results_map:
                                cur_problem_results = results_map[problem]
                                nodes = cur_problem_results[planner][compilation][pruning]
                                for node in nodes:
                                    for hyps in ['0']:
                                        num_problems += 1
                                        cur_node = nodes[node]

                                        if cur_node[hyps][setting]['has_solution'] == 'True':
                                            sol += 1

                                        
                                        result = None 
                                        if not self.completed_by_all_approaches(cur_problem_results, node, hyps, 'PO'): #TODO: determine if node completed by all approaches
                                            # print('not completed by all: ', problem)
                                            continue 

                                        result = float(cur_node[hyps][setting][record])
                                        results_for_record.append(result)
                                
                            table_results[planner][compilation][pruning][record_label] = average(results_for_record)
                            table_results[planner][compilation][pruning][setting + '_sol'] = float(sol) / num_problems

        for planner in table_results:
            for compilation in table_results[planner]:
                print('+ - - - - - - - - - - - - - - - - - - - - +')
                print('+------%s/%s------+' % (planner, compilation))
                for pruning in table_results[planner][compilation]:
                    print("pruning: %s" % pruning)
                    print('+ - - - - - - - - - - - - - - - - - - - - +')
                    results = table_results[planner][compilation][pruning]
                    for key in results:
                        val = results[key] 
                        print("%s :: %f" % (key, val))

    def write_to_dest(self, dest):
        with open(dest, 'w') as f:
            print(self.dict, file=f)

        print("Success! See %s for results. View JSON here: http://jsonviewer.stack.hu/" % dest)
        return 