__author__ = 'sarah'

from UMD import heuristic
import causal_graph
import utils_apk
import copy

def get_heuristic(heuristic_name, umd_problem):
    if 'cg-unique' in heuristic_name:
        return cg_unique_heuristic
    if 'simplified_heur' in heuristic_name:
        return simplified_design_heuristic
    else:
        return heuristic.get_heuristic(heuristic_name, umd_problem)


def cg_unique_heuristic(design_node):

    if design_node.umd_problem.causal_graphs is None:
        print('before getting Causal Graph')
        design_node.umd_problem.causal_graphs = causal_graph.get_causal_graphs_from_compilation(design_node.umd_problem)
        print('after getting Causal Graph')

    #COMPLETE !


def simplified_design_heuristic(design_node):
    print(design_node)
    pruned_successors = []
    # compute meta-modification
    simplified_successor_key = utils_apk.get_design_sequence_key(design_node)
    # check if the value already exists in the table
    # if the value was not already computed - compute it
    if simplified_successor_key not in design_node.umd_problem.design_values_table:
            simplified_sequence = utils_apk.get_simplified_design_sequence(design_node)
            model_temp = copy.deepcopy(design_node.state)
            for mod in simplified_sequence:
                model_temp = mod.apply(model_temp)
            # get value
            simplified_value = design_node.umd_problem.evaluate(model_temp)
            design_node.umd_problem.design_values_table[simplified_successor_key] = simplified_value

    # get the simplified value
    simplified_value = design_node.umd_problem.design_values_table[simplified_successor_key]
    return simplified_value
