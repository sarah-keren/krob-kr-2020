
"kofi"
import grd, defs_apk, utils_apk, gr_poa_kp, er_poa_kp, modification_apk, pruning_apk, er_umd, heuristic_apk, his
import os, shutil, sys, time
from UMD import search, design, constraint, pruning
import logging

def process_input():


    index = 1
    utility = sys.argv [index]
    defs_apk.set_utility(utility)
    index+=1
    domain_file_name = sys.argv [index]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/d.pddl'
    domain_id = utils_apk.get_domain_id(domain_file_name)
    defs_apk.set_domain_ID(domain_id)
    index+=1
    template_file_name = sys.argv[index]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/template.pddl'
    index += 1
    hyps_file_name = sys.argv[index]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/hyps.dat'
    index += 1
    instance_id = utils_apk.get_instance_id(domain_file_name, hyps_file_name)
    design_file_name = sys.argv[index] # NA means the changes are encoded
    index += 1
    design_problem_file_name = sys.argv[index]  # NA means the changes are encoded
    index += 1
    design_budget = int(sys.argv[index])
    index += 1
    search_method_name = sys.argv[index]
    index += 1
    heuristic_name = sys.argv[index]
    index += 1
    pruning_methods_name = sys.argv[index]
    index += 1
    solver_path = sys.argv[index]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    solver_type = defs_apk.get_solver_type(solver_path)
    index += 1
    planner_type = sys.argv[index].lower()
    defs_apk.set_planner_type(planner_type)
    index += 1
    compilation = sys.argv[index].lower()
    defs_apk.set_compilation(compilation)


    [log_file, log_file_results, log_file_analytics] = defs_apk.create_log_files()
    utils_apk.initialize_logging(log_file_analytics.name)


    # the prudent solver doesn't work with FF
    #if 'prudent' in solver_path.lower() and 'ff' in planner_type.split(':')[0].lower():
    #    print('prudent solver ' + solver_path + " cant't work with FF since it doesn't support non-uniform costs")
    #    #raise NotImplementedError

    # create the umd problem TODO
    #if defs_apk.SOLVER_PRP in solver_type and utility.lower() == 'grd':
    #    um_problem = gr_poa_prp.GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)
    um_problems = []

    if defs_apk.SOLVER_REPLANNER in solver_type and utility.lower() == 'grd':
        um_problem = gr_poa_kp.GR_POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation)
        um_problems.append(um_problem)

    elif defs_apk.SOLVER_REPLANNER in solver_type and (utility.lower() == 'er-umd' or utility.lower() == 'his'):
        if defs_apk.MULTIPLE_GOALS:
            um_problem = er_poa_kp.ER_POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name,
                                             planner_type, compilation)
            um_problems.append(um_problem)
        else:
            index = 0
            # get all hyps in the hyps file
            original_hyps_file= open(hyps_file_name, "r")
            lines = original_hyps_file.readlines()
            original_hyps_file.close()
            for hyp in lines:
                parsed_hyps_file_name = os.path.abspath(os.path.join(defs_apk.get_gen_folder_name(),'parsed_hyps_%d.dat'%index))
                parsed_hyps_file = open(parsed_hyps_file_name, "w")
                parsed_hyps_file.write(hyp)
                parsed_hyps_file.close()
                index+=1
                #um_problem = poa_kp.POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name, compilation)
                um_problem = er_poa_kp.ER_POA_KP(solver_path, domain_file_name, template_file_name, parsed_hyps_file_name,planner_type, compilation)
                um_problems.append(um_problem)
    else:
        print('solver type '+ solver_type+ ' with utility type '+ utility + " not supported")
        raise NotImplementedError

    # handle constraints
    constraint_list = []
    bud_constraint = constraint.BudgetConstraint(design_budget)
    constraint_list.append(bud_constraint)
    umd_problems = []

    # create UMD problem
    if utility.lower() == 'grd':
        for um_problem in um_problems:
            umd_problem = grd.GRD(um_problem, constraint_list, design_file_name, design_problem_file_name)
            umd_problems.append(umd_problem)
    elif utility.lower() == 'er-umd':
        for um_problem in um_problems:
            umd_problem = er_umd.ER_UMD(um_problem, constraint_list, design_file_name, design_problem_file_name)
            umd_problems.append(umd_problem)
    elif utility.lower() == 'his':
        use_simpled_val = False
        if 'simple-val' in search_method_name:
            use_simple_val = True
        for um_problem in um_problems:
            umd_problem = his.HIS(um_problem, constraint_list, design_file_name, design_problem_file_name, True, use_simple_val)
            umd_problems.append(umd_problem)

    umd_problems_and_structs = []
    for umd_problem in umd_problems:
        termination_criteria = None
        if utility.lower() == 'grd':
            termination_criteria = design.TerminationCriteriaOptimalValue(0, True)
        elif utility.lower() == 'er-umd' or utility.lower() == 'his':
            #termination_criteria = er_umd.TerminationCriteriaOptimalValueHelpful(0, True)
            termination_criteria = er_umd.TerminationCriteriaReachalbeGoals(0, True)

        # create & initialize frontier
        heuristic_func = None
        if defs_apk.NA not in heuristic_name :
            heuristic_func = heuristic_apk.get_heuristic(heuristic_name, umd_problem)
            frontier = search.PriorityQueue(min, heuristic_func)
        else:
            frontier = search.FIFOQueue()

        if defs_apk.NA in pruning_methods_name:
            prune_func = None  # pruning.prune_grd_currentFocus
        else:
            prune_func = pruning_apk.get_pruning_func(pruning_methods_name, umd_problem)
        umd_problems_and_structs.append([utility, umd_problem, search_method_name, frontier, termination_criteria, heuristic_name, prune_func, log_file, log_file_results])

    return umd_problems_and_structs


def run_design(umd_problem, search_method_name, frontier, termination_criteria,  heuristic_name, prune_func, log_file, log_file_results):

    logging.info('Running instance_id:%s, utility:%s, design_budget:%s, search_method_name:%s, heuristic:%s, pruning_methods_name:%s, solver_path:%s, compilation:%s, planner_type:%s' % (
        utils_apk.get_instance_id(umd_problem.initial_model.domain_file_name, umd_problem.initial_model.hyps_file_name), umd_problem.utility, umd_problem.constraints[0], search_method_name, heuristic_name, prune_func,  umd_problem.initial_model.solver_path, umd_problem.initial_model.compilation, umd_problem.initial_model.planner_type))


    log_file.write('\nDesigning domain::%s\ntemplate::%s\nhyps::%s\nbudget::%s\nmethod::%s\nheuristic::%s\npruning::%s\nsolver::%s\nplanner::%s\ncompilation::%s\n' %
        (umd_problem.initial_model.domain_file_name, umd_problem.initial_model.template_file_name, umd_problem.initial_model.hyps_file_name, umd_problem.constraints, search_method_name, heuristic_name, prune_func, umd_problem.initial_model.solver_path, umd_problem.initial_model.planner_type, umd_problem.initial_model.compilation))
    log_file.write('\n----------------------\n')
    log_file.flush()

    log_file_results.write('\n----------------------')
    log_file_results.write('\nDesigning domain::%s\ntemplate::%s\nhyps::%s\nbudget::%s\nmethod::%s\nheuristic::%s\npruning::%s\nsolver::%s\nplanner::%s\ncompilation::%s\n' %
        (umd_problem.initial_model.domain_file_name, umd_problem.initial_model.template_file_name, umd_problem.initial_model.hyps_file_name, umd_problem.constraints, search_method_name, heuristic_name, prune_func, umd_problem.initial_model.solver_path, umd_problem.initial_model.planner_type, umd_problem.initial_model.compilation))
    log_file_results.flush()

    if defs_apk.BFD.lower() in search_method_name.lower():
        # create closed list
        closed_list = search.ClosedListOfSets()

        # time
        start_time = time.time()

        # perform design
        # BFD with simplified values
        computed_count = 0
        if 'simple-val' in search_method_name.lower():
            [best_value, best_node, explored, ex_terminated, results_log] = design.best_first_design_val(umd_problem,
                                                                                                     frontier,
                                                                                                     closed_list,
                                                                                                     termination_criteria,
                                                                                                     prune_func,
                                                                                                     log_file,
                                                                                                     log_file_results,
                                                                                                     defs_apk.ITER_LIMIT,
                                                                                                     defs_apk.DEFAULT_TIME_LIMIT)
            computed_count = len(umd_problem.design_values_table.keys())
        # BFD
        else:
            [best_value, best_node, explored, ex_terminated, results_log] = design.best_first_design(umd_problem, frontier, closed_list, termination_criteria, prune_func, log_file,log_file_results, defs_apk.ITER_LIMIT, defs_apk.DEFAULT_TIME_LIMIT)
            computed_count = explored

        # get exe time
        calc_time = time.time() - start_time  # , "seconds"

        # log results
        for cost in results_log:
            log_message = 'Best_value_for_cost-%d:'%cost+defs_apk.SEPARATOR+'cur_value::%d'%results_log[cost][0]+defs_apk.SEPARATOR+'cur_node::'+results_log[cost][1].__repr__()+defs_apk.SEPARATOR+'calc_time::%.2f'%results_log[cost][2]+defs_apk.SEPARATOR+'explored::%d'%results_log[cost][3]+'\n'
            log_file_results.write(log_message)

        log_message = 'Total_best_value:%.2f'%best_value + defs_apk.SEPARATOR + ' best_node:'+ best_node.__repr__() + defs_apk.SEPARATOR + 'cost:%.2f'%best_node.cost()[0] + defs_apk.SEPARATOR + 'explored:%s'%explored+ ' computed:%s'%computed_count+ defs_apk.SEPARATOR + 'time:%.6f'%calc_time+ defs_apk.SEPARATOR+ 'ex_terminated:'+ str(ex_terminated) +'\n'
        log_file.write(log_message)
        log_file_results.write(log_message)


    else:
        print('only BFD search method supported for now: existing')
        raise NotImplementedError


def clean_dirs(folder_name):
    if os.path.exists(folder_name):
        shutil.rmtree(folder_name)
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)

#if __name__ == '__main__':
#    #defs_apk.clear_logs_folder()
#    [utility, umd_problem, search_method_name, frontier, prune_func, log_file, log_file_results] = process_input()
#    run_design(umd_problem, search_method_name, frontier, prune_func, log_file, log_file_results)

if __name__ == '__main__':
    umd_problems = process_input()
    print('len(umd_problems)')
    print(len(umd_problems))
    for umd_problem in umd_problems:
        [utility, umd_problem, search_method_name, frontier, termination_criteria, heuristic_name, prune_func, log_file, log_file_results] = umd_problem
        run_design(umd_problem, search_method_name, frontier, termination_criteria, heuristic_name, prune_func, log_file, log_file_results)
    log_file.close()
    log_file_results.close()

