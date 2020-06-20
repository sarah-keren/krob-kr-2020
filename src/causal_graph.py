import sys, os
import solver_fd
import defs_apk, utils

class CausalGraph:

    def __init__(self, domain_file_name, problem_file_name, destination_folder, solver_path=defs_apk.FD_PATH):
        self.domain_file_name = domain_file_name
        self.problem_file_name = problem_file_name
        self.solver_path = solver_path
        self.destination_folder = destination_folder
        self.graph = self.build_causal_graph()


    def build_causal_graph(self):

        planner_out_file_name = os.path.join(self.destination_folder, 'cg')
        solver_fd.get_causal_graph(self.solver_path, self.domain_file_name, self.problem_file_name, self.destination_folder, planner_out_file_name)
        planner_out_file = open(planner_out_file_name, "r")
        lines = planner_out_file.readlines()
        planner_out_file.close()

        index = -1
        while index <= len(lines):
            index += 1
            if 'Causal graph::' in lines[index]:
                break

        causal_graph = {}
        while index <= len(lines):
            index += 1

            if 'done!' in lines[index]:
                # done reading lines
                #print('done')
                break

            if 'Var::' in lines[index]:
                #print('found new fact')
                #print(lines[index])
                # we are here with a new var
                #print(lines[index])
                line = lines[index].replace('\n','')
                split_line = line.split('#')
                var_id = split_line[1].split()[0]
                #var_id = var_id.replace('var','')
                #print('var_id')
                #print(var_id)
                var_size = int(split_line[1].split('::')[-1])
                #print('var_size')
                #print(var_size)

                atmos = []
                atom_index = 0
                index += 1
                index += 1
                while atom_index < var_size:
                    #print(lines[index])
                    cur_atom = lines[index]
                    cur_atom = cur_atom.replace('Atom ', '')
                    cur_atom = cur_atom.replace('\n','')
                    cur_atom = cur_atom.replace(' ', '')
                    atmos.append(cur_atom)
                    atom_index += 1
                    index += 1
                # skip the line with #var_id
                index += 1

                # after the vars come the relationships
                cur_line = lines[index].replace('\n','')
                pre_eff_arcs = cur_line.split('pre->eff arcs: ')[1]
                index += 1

                cur_line = lines[index].replace('\n', '')
                eff_pre_arcs = cur_line.split('eff->pre arcs: ')[1]
                index +=1

                cur_line = lines[index].replace('\n', '')
                eff_eff_arcs = cur_line.split('eff->eff arcs: ')[1]
                index += 1

                cur_line = lines[index].replace('\n', '')
                successors = cur_line.split('successors: ')[1]
                index +=1

                cur_line = lines[index].replace('\n', '')
                predecessors = cur_line.split('predecessors: ')[1]

                causal_graph[var_id] = [atmos, pre_eff_arcs, eff_pre_arcs, eff_eff_arcs, successors, predecessors]

        #print('causal_graph:')
        #for var in causal_graph:
        #    print(var)
        #    print(causal_graph[var])


        return causal_graph

    def is_atom_in_causal_graph(self, atom):

        for var in self.graph:
            var_val = self.graph[var][0]
            if utils.is_atom_in_list(atom, var_val):
                return True
        return False


def get_causal_graphs_from_compilation(umd_problem):

    causal_graphs = []

    problem_files = umd_problem.initial_model.get_compiled_files()

    for domain_file, problem_file in problem_files:
        graph = CausalGraph(domain_file, problem_file, defs_apk.get_gen_folder_name())
        causal_graphs.append(graph)

    return causal_graphs


def get_causal_graphs(umd_problem):

    causal_graphs = []
    problem_files = umd_problem.initial_model.get_problem_files()

    # parse the domain file (removing sensing actions which are assumed to appear at the end)
    parsed_domain_file_name = os.path.join(defs_apk.get_gen_folder_name(),'parsed_domain_full_obs.pddl')
    utils.part_to_full_obs_domain(umd_problem.initial_model.domain_file_name, parsed_domain_file_name)


    # parse the problem file
    parsed_problem_files = []
    index = 0
    for file in problem_files:
        full_obs_file_name = os.path.join(defs_apk.get_gen_folder_name(),'full_obs_%d.pddl'%index)
        utils.part_to_full_obs_problem(file, full_obs_file_name)
        parsed_problem_files.append(full_obs_file_name)
        index += 1

    for problem_file in parsed_problem_files:
        graph = CausalGraph(parsed_domain_file_name, problem_file)
        causal_graphs.append(graph)

    return causal_graphs


if __name__ == '__main__':

    results_file = sys.argv[1]
    causal_graph = CausalGraph(results_file)
