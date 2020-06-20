__author__ = 'sarah'


import causal_graph, utils_apk, defs_apk
import logging
import copy
def get_pruning_func(prune_func_name, umd_problem):

    pruning_func = None

    if 'cg1' in prune_func_name.lower() and 'assumed' in prune_func_name.lower():
        return prune_not_in_one_causal_graph_and_assumed

    if 'cg' in prune_func_name.lower() and 'assumed' in prune_func_name.lower():
        return  prune_not_in_causal_graph_and_assumed

    if 'cg1' == prune_func_name.lower():
        return  prune_not_in_one_causal_graph

    elif 'cg' == prune_func_name.lower():
        # load the causal graphs into the umd class
        #umd_problem.causal_graphs = causal_graph.get_causal_graphs(umd_problem)

        # send the pruning method below
        return  prune_not_in_causal_graph

    elif 'assumed' == prune_func_name.lower():
        # send the pruning method below
        return prune_already_assumed

    elif 'focus' == prune_func_name.lower():
        # send the pruning method below
        return prune_currentFocus

    elif 'focusandcg' == prune_func_name.lower():
        # send the pruning method below
        return prune_currentFocusandCG

    elif 'simplified' == prune_func_name.lower():
        # send the pruning method below
        return prune_simplified_design

    elif 'assumedandcg' == prune_func_name.lower():
        # send the pruning method below
        return prune_assumed_and_CG


    else:
        print('prune_func_name %s is not yet defined'%prune_func_name)
        raise NotImplementedError

    return pruning_func


def get_pruning_funcs(prune_funcs_name, umd_problem):

    pruning_funcs_names = prune_funcs_name.split(':')
    pruning_funcs_list = []

    for prune_func_name in pruning_funcs_names:
        if 'cg1' == prune_func_name.lower():
            pruning_funcs_list.append(prune_not_in_one_causal_graph)

        elif 'cg' == prune_func_name.lower():
            # load the causal graphs into the umd class
            #umd_problem.causal_graphs = causal_graph.get_causal_graphs(umd_problem)

            # send the pruning method below
            pruning_funcs_list.append(prune_not_in_causal_graph)

        elif 'assumed' == prune_func_name.lower():
            # send the pruning method below
            pruning_funcs_list.append(prune_already_assumed)

        elif 'focus' == prune_func_name.lower():
            # send the pruning method below
            pruning_funcs_list.append(prune_currentFocus)

        elif 'focusandcg' == prune_func_name.lower():
            # send the pruning method below
            pruning_funcs_list(prune_currentFocusandCG)

        elif 'assumedandcg' == prune_func_name.lower():
            # send the pruning method below
            pruning_funcs_list(prune_assumed_and_CG)



        else:
            print('prune_func_name %s is not yet defined'%prune_func_name)
            raise NotImplementedError

    return pruning_funcs_list



def prune_not_in_causal_graph_and_assumed(sucessors, node):
    sucessors = prune_already_assumed(sucessors, node)
    sucessors = prune_not_in_causal_graph(sucessors, node)
    return sucessors


def prune_not_in_one_causal_graph_and_assumed(sucessors, node):
    sucessors = prune_already_assumed(sucessors, node)
    sucessors = prune_not_in_one_causal_graph(sucessors, node)
    return sucessors

# we will remove assumptions that are made anyway by any agent in the model
def prune_already_assumed(sucessors, node):

    sucessors_after_pruning = []
    for sucessor in sucessors:
        pos_atom = sucessor.action.get_pos_atom()
        neg_atom = sucessor.action.get_neg_atom()
        is_relevant = False
        assumption_sets = node.state.assumption_sets
        if assumption_sets is None or len(assumption_sets) ==0:
            continue
        # we are counting the number of hyps that make the assumption suggested by the successor modificaiton
        hyp_count = 0
        for assumption_set in assumption_sets:
            # we want the assumptions made on the first iteration
            if assumption_sets is None or len(assumption_set) == 0:
                continue
            first_iter_assumptions = assumption_set[0]
            for step_assumptions in first_iter_assumptions:
                for assumption in step_assumptions:
                    # negative information
                    if 'K_not_' in assumption:
                        if neg_atom is None:
                            continue
                        parsed_assumption = assumption.replace('K_not_','')
                        parsed_assumption = parsed_assumption.replace(')', '')
                        parsed_assumption = parsed_assumption.replace('(', '')
                        parsed_neg_atom = neg_atom.replace(' ', '_')
                        parsed_neg_atom = parsed_neg_atom.replace(')', '')
                        parsed_neg_atom = parsed_neg_atom.replace('(', '')
                        if parsed_neg_atom in parsed_assumption:
                            hyp_count += 1
                    # positive information
                    else:
                        if pos_atom is None:
                            continue
                        parsed_assumption = assumption.replace('K_', '')
                        parsed_assumption = parsed_assumption.replace(')', '')
                        parsed_assumption = parsed_assumption.replace('(', '')
                        parsed_pos_atom = pos_atom.replace(' ', '_')
                        parsed_pos_atom = parsed_pos_atom.replace(')', '')
                        parsed_pos_atom = parsed_pos_atom.replace('(', '')
                        if parsed_pos_atom in parsed_assumption:
                            hyp_count += 1


        # if ths assumption is not made by all the hyps (equal to the length of the assumptions sets)
        if hyp_count < len(node.state.assumption_sets):
            sucessors_after_pruning.append(sucessor)
        else:
            print('Information shaping %s is an assumption made by all hyps anyway and is pruned'%sucessor)

    return sucessors_after_pruning



def prune_currentFocusandCG(successors, node):

    return prune_currentFocus(successors, node, True, True)


def prune_simplified_design_and_CG(successors, node):

    return prune_simplified_design(successors, node, True, True)


def prune_assumed_and_CG(successors, node, prune_assumed = False, prune_cg = False):

    if prune_assumed:
        successors = prune_already_assumed(successors, node)
    if prune_cg:
        successors = prune_not_in_causal_graph(successors, node)

    return successors


def prune_simplified_design(successors, node, prune_assumed = False, prune_cg = False):

    if prune_assumed:
        successors = prune_already_assumed(successors, node)
    if prune_cg:
        successors = prune_not_in_causal_graph(successors, node)

    pruned_successors = []
    for succesor in successors:
        # compute meta-modification
        simplified_successor_key = utils_apk.get_simplified_successor(succesor)
        # check if the value already exists in the table
        # if the value was not already computed - compute it
        if simplified_successor_key not in node.umd_problem.design_values_table:
            simplified_sequence = utils_apk.get_simplified_design_sequence(succesor,successors,node.umd_problem)
            model_temp = copy.deepcopy(node.state)
            for mod in simplified_sequence:
                model_temp = mod.apply(model_temp)
            # get value
            simplified_value = node.umd_problem.evaluate(model_temp)
            node.umd_problem.design_values_table[simplified_successor_key] = simplified_value

        # get the simplified value
        simplified_value = node.umd_problem.design_values_table[simplified_successor_key]

        # decide whether to prune the node based on the value of the meta-modification
        bPrune = node.umd_problem.to_prune(simplified_value)

        if not bPrune:
            pruned_successors.append(succesor)

    successor_string = ''
    for suc in pruned_successors:
        successor_string += suc.str_modification_seq()
    logging.debug(successor_string)

    return pruned_successors

# this is wrong
def prune_currentFocus(successors, node, prune_assumed = False, prune_cg = False):

    if prune_assumed:
        successors = prune_already_assumed(successors, node)
    if prune_cg:
        successors = prune_cg(successors, node)


    logging.debug('before pruning:')
    successor_string = ''
    pruned_string = ''
    for suc in successors:
        successor_string+= suc.str_modification_seq()
    logging.debug(successor_string)
    node_mod_seq = node.transition_path()

    pruned_successors = []
    # get all plans for each goal
    for fo_plan_info, po_plan_info, opop_plan_info in zip(node.state.fo_plans, node.state.po_plans, node.state.opop_plans):


        [fo_plan, fo_has_solution, fo_cost] = fo_plan_info
        [po_plan, po_has_solution, po_cost] = po_plan_info
        [opop_plans, opop_has_solution, opop_cost] = opop_plan_info

        logging.debug('fo_plan:')
        logging.debug(fo_plan)
        logging.debug('po_plan:')
        logging.debug(po_plan)
        logging.debug('opop_plan:')
        logging.debug(opop_plans)

        # the actor knows the cost is infinite
        #if opop_cost >= defs_apk.INFINITE and fo_cost >= defs_apk.INFINITE:
        #    continue

        # the cost is infinite - no point in continuing
        # TODO SARAH - extend this to inform the actor that the goal is not achiavable
        if not fo_has_solution:
            continue

        # the actor achieves the goal - no point in continuing the search
        if po_has_solution:
            continue

        # there is a solution - but the actor fails - we focus on the current po-plan
        else:
            pruned_successors = get_po_successors(node, successors, fo_plan_info, po_plan_info, opop_plan_info)

    #if add_cur_node:
    #    cur_node_copy = copy.deepcopy(node)
    #    pruned_successors.append(cur_node_copy)

    return pruned_successors

def get_po_successors(node, successors, fo_plan_info, po_plan_info, opop_plan_info):

    pruned_successors = []
    [fo_plan, fo_has_solution, fo_cost] = fo_plan_info
    [po_plan, po_has_solution, po_cost] = po_plan_info
    [opop_plans, opop_has_solution, opop_cost] = opop_plan_info

    # get the successors that are on the po_plan
    for successor in successors:
        for opop_plan,opop_cost in opop_plans:
            for action in opop_plan:
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors:
                        pruned_successors.append(successor)

    return pruned_successors

def prune_currentFocus_old_deal_with_this(successors, node, prune_assumed = False, prune_cg = False):

    if prune_assumed:
        successors = prune_already_assumed(successors, node)
    if prune_cg:
        successors = prune_cg(successors, node)

    logging.debug('before pruning:')

    successor_string = ''
    pruned_string = ''
    for suc in successors:
        successor_string+= suc.str_modification_seq()
    logging.debug(successor_string)


    node_mod_seq = node.transition_path()


    # the optimal results was achieved - no successors
    if node.state.is_FO_value_Reached():
        logging.debug('FO reached')
        return []

    pruned_successors = []

    # get all plans for each goal
    for fo_plan_info, po_plan_info, opop_plan_info in zip(node.state.fo_plans, node.state.po_plans, node.state.opop_plans):


        [fo_plan, fo_has_solution, fo_cost] = fo_plan_info
        [po_plan, po_has_solution, po_cost] = po_plan_info
        [opop_plan, opop_has_solution, opop_cost] = opop_plan_info

        logging.debug('fo_plan:')
        logging.debug(fo_plan)
        logging.debug('po_plan:')
        logging.debug(po_plan)
        logging.debug('opop_plan:')
        logging.debug(opop_plan)

        # the actor knows there is no solution
        if not fo_has_solution and not opop_has_solution:
            print('the actor knows there is no solution')
            continue

        # if there is no solution and the actor fails
        if not fo_has_solution and not po_has_solution:
            print('the actor fails and there is no solution')
            continue

        # if the actor believes in a cost that is lower than the actual fo_cost
        if (not fo_has_solution and opop_has_solution) or (opop_cost <= fo_cost):

            print('the actor is making a decision that is based on a wrong assumptions which needs to be clarified')
            # only consider successors that are related to the opop path
            for action in opop_plan:
                for successor in successors:
                    #suc_mod_seq = successor.transition_path()
                    # consider only successors that don't include the same modificaitons as the parent node
                    #if set(suc_mod_seq).issubset(set(node_mod_seq)):
                    #    continue
                    if utils_apk.is_related_to(successor, action):
                        if successor not in pruned_successors:
                            pruned_successors.append(successor)
                            pruned_string += successor.str_modification_seq()


        # there is no point to continue the search since there is no way to improve the solution
        elif fo_cost == po_cost:
            print('the actor is following a cost minimal plan')
            continue

        # give information about the fo_plan
        print('lead the actor in the right direction')
        # only consider successors that are related to the FO plan
        for action in fo_plan:
            for successor in successors:
                suc_mod_seq = successor.transition_path()
                # consider only successors that don't include the same modifications as the parent node
                if set(suc_mod_seq).issubset(set(node_mod_seq)):
                    continue
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors and (not successor in node_mod_seq):
                        pruned_successors.append(successor)
                        pruned_string += successor.str_modification_seq()

    logging.debug('pruned_string')
    logging.debug(pruned_string)

    return pruned_successors


def prune_currentFocus_old(successors, node):
    # the optimal results was achieved - no successors
    if node.state.is_FO_value_Reached():
        return []

    # if the actor believes in a cost that is lower than the actual fo_cost
    if (not fo_has_solution and opop_has_solution) or (opop_cost <= fo_cost):
        print('the actor is making some mistake which needs to be corrected')
        pruned_successors = []
        # only consider successors that are related to the opop path
        for action in opop_plan:
            for successor in successors:
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors:
                        pruned_successors.append(successor)
        return pruned_successors

    # there is not point to continue the search since there is no way to improve the solution
    elif fo_cost == po_cost:
        print('the actor is following a cost minimal plan')
        return []

    # give information about the fo_plan
    else:
        print('lead the actor in the right direction')
        pruned_successors = []
        # only consider successors that are related to the FO plan
        for action in fo_plan:
            for successor in successors:
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors:
                        pruned_successors.append(successor)
        return pruned_successors


def prune_currentFocus_deprecated(successors, node):

    # get all costs
    [opop_plan, opop_has_solution,opop_cost] = node.state.opop_plan
    [fo_plan, fo_has_solution,fo_cost] = node.state.fo_plan
    [po_plan, po_has_solution,po_cost] = node.state.po_plan

    # if the actor believes in a cost that is lower than the actual fo_cost
    if (not fo_has_solution and opop_has_solution) or (opop_cost <= fo_cost):
        print('the actor is making some mistake which needs to be corrected')
        pruned_successors = []
        # only consider successors that are related to the opop path
        for action in opop_plan:
            for successor in successors:
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors:
                        pruned_successors.append(successor)
        return pruned_successors

    # there is not point to continue the search since there is no way to improve the solution
    elif fo_cost == po_cost:
        print('the actor is following a cost minimal plan')
        return []

    # give information about the fo_plan
    else:
        print('lead the actor in the right direction')
        pruned_successors = []
        # only consider successors that are related to the FO plan
        for action in fo_plan:
            for successor in successors:
                if utils_apk.is_related_to(successor, action):
                    if successor not in pruned_successors:
                        pruned_successors.append(successor)
        return pruned_successors


def prune_not_in_causal_graph(sucessors, node):

    if node.umd_problem.causal_graphs is None:
        print('before getting Causal Graph')
        node.umd_problem.causal_graphs = causal_graph.get_causal_graphs_from_compilation(node.umd_problem)
        print('after getting Causal Graph')

    sucessors_after_pruning = []
    for sucessor in sucessors:
        is_relevant = False
        for graph in node.umd_problem.causal_graphs:
            pos_atom = sucessor.action.get_pos_atom()
            neg_atom = sucessor.action.get_neg_atom()
            if graph.is_atom_in_causal_graph(pos_atom):
                is_relevant = True
                break
            if graph.is_atom_in_causal_graph(neg_atom):
                is_relevant = True
                break

        if is_relevant:
            sucessors_after_pruning.append(sucessor)
    return sucessors_after_pruning


def prune_not_in_one_causal_graph(sucessors, node):

    if node.umd_problem.causal_graphs is None:
        print('before getting Causal Graph')
        node.umd_problem.causal_graphs = causal_graph.get_causal_graphs_from_compilation(node.umd_problem)
        print('after getting Causal Graph')

    sucessors_after_pruning = []
    for sucessor in sucessors:
        count_cg = 0
        for graph in node.umd_problem.causal_graphs:
            pos_atom = sucessor.action.get_pos_atom()
            neg_atom = sucessor.action.get_neg_atom()
            if graph.is_atom_in_causal_graph(pos_atom):
                count_cg += 1
            elif graph.is_atom_in_causal_graph(neg_atom):
                count_cg += 1
        if count_cg == 1:
            sucessors_after_pruning.append(sucessor)

    return sucessors_after_pruning
