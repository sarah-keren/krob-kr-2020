__author__ = 'sarah'


import grd, defs_apk, utils_apk, gr_poa_prp, gr_poa_kp, modification_apk, pruning_apk
import os, shutil, sys, time
from UMD import search, design, heuristic, constraint, pruning




def process_input():

    domain_file_name = sys.argv [1]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/d.pddl'
    template_file_name = sys.argv[2]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/template.pddl'
    hyps_file_name = sys.argv[3]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/hyps.dat'
    design_file_name = sys.argv[4] # NA means the changes are encoded
    design_problem_file_name = sys.argv[5]  # NA means the changes are encoded

    design_budget = int(sys.argv[6])
    search_method_name = sys.argv[7]
    heuristic_name = sys.argv[8]
    pruning_method_name = sys.argv[9]

    solver_path = sys.argv[10]  # '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    solver_type = defs_apk.get_solver_type(solver_path)
    planner_type = sys.argv[11].lower()

    log_file = open(defs_apk.DESIGN_LOG_NAME, "a")
    log_file.write('\nDesigning domain::%s\ntemplate::%s\nhyps::%s\nbudget::%d\nmethod::%s\nheuristic::%s\npruning::%s\nsolver::%s\nplanner::%s\n' %
               (domain_file_name, template_file_name, hyps_file_name, design_budget, search_method_name,heuristic_name,pruning_method_name,solver_type,planner_type))
    log_file.write('\n----------------------\n')
    log_file.flush()


    results_log_file = open('%s'%defs_apk.DESIGN_RESULTS_LOG_NAME, "a")
    results_log_file.write('\n----------------------')
    results_log_file.write('\nDesigning domain::%s\ntemplate::%s\nhyps::%s\nbudget::%d\nmethod::%s\nheuristic::%s\npruning::%s\nplanner::%s\n' %
               (domain_file_name, template_file_name, hyps_file_name, design_budget, search_method_name,heuristic_name,pruning_method_name,planner_type))
    results_log_file.flush()


    if defs_apk.SOLVER_PRP in solver_type:
        # create the gr problem
        gr_problem = gr_poa_prp.GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)
    elif defs_apk.SOLVER_KP in solver_type:
        # create the gr problem
        gr_problem = gr_poa_kp.GR_POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type)

    else:
        print('solver type '+ solver_type+" not supported")
        raise NotImplementedError

    # constraints
    constraint_list = []
    bud_constraint = constraint.BudgetConstraint(design_budget)
    constraint_list.append(bud_constraint)

    # create GRD problem
    grd_problem = grd.GRD(gr_problem, constraint_list, design_file_name, design_problem_file_name)


    # create frontier and initialize it with the heuristic
    heuristic_func = None
    if defs_apk.NA not in heuristic_name:
        heuristic_func = heuristic.get_heuristic(heuristic_name,grd_problem)
        # zero heuristic
        frontier = search.PriorityQueue(min, heuristic_func)
    else:
        frontier = search.FIFOQueue()
    # create closed list
    closed_list = search.ClosedListOfSets()
    termination_criteria = design.TerminationCriteriaOptimalValue(0 ,True)
    if defs_apk.NA in pruning_method_name:
        prune_func = None  # pruning.prune_grd_currentFocus
    else:
        prune_func = pruning_apk.get_pruning_func(pruning_method_name,grd_problem)


    return [grd_problem, search_method_name, frontier,prune_func,log_file, results_log_file]


def run_design(grd_problem, search_method_name,  frontier, prune_func, log_file, results_log_file):



    if defs_apk.BFD.lower() in search_method_name.lower():
        # create closed list
        closed_list = search.ClosedListOfSets()
        termination_criteria = design.TerminationCriteriaOptimalValue(0, True)

        # time
        start_time = time.time()

        # perform design
        [best_value, best_node, explored, ex_terminated, results_log] = design.best_first_design(grd_problem, frontier, closed_list, termination_criteria, prune_func, log_file,results_log_file, defs_apk.ITER_LIMIT, defs_apk.DEFAULT_TIME_LIMIT)

        # get exe time
        calc_time = time.time() - start_time  # , "seconds"


        # log results
        for cost in results_log:
            log_message = 'Best_value_for_cost-%d:'%cost+defs_apk.SEPARATOR+'cur_value::%d'%results_log[cost][0]+defs_apk.SEPARATOR+'cur_node::'+results_log[cost][1].__repr__()+defs_apk.SEPARATOR+'calc_time::%.2f'%results_log[cost][2]+defs_apk.SEPARATOR+'explored::%d'%results_log[cost][3]+'\n'
            results_log_file.write(log_message)

        log_message = 'Total_best_value:%.2f'%best_value + defs_apk.SEPARATOR + ' best_node:'+ best_node.__repr__() + defs_apk.SEPARATOR + 'cost:%.2f'%best_node.cost()[0] + defs_apk.SEPARATOR + 'explored:%s'%explored+ defs_apk.SEPARATOR + 'time:%.6f'%calc_time+ defs_apk.SEPARATOR+ 'ex_terminated:'+ str(ex_terminated) +'\n'
        log_file.write(log_message)
        results_log_file.write(log_message)

        log_file.close()
        results_log_file.close()

    else:
        print('only BFD search method supported for now: existing')
        raise NotImplementedError



if __name__ == '__main__':

    if os.path.exists(defs_apk.get_gen_folder_name()):
        shutil.rmtree(defs_apk.get_gen_folder_name())
    if not os.path.exists(defs_apk.get_gen_folder_name()):
        os.makedirs(defs_apk.get_gen_folder_name())

    if not os.path.exists(defs_apk.get_log_folder_name()):
        # shutil.rmtree(defs_apk.RES_FOLDER)
        os.makedirs(defs_apk.get_log_folder_name())

    [grd_problem, search_method_name, frontier, prune_func, log_file, results_log_file] = process_input()

    run_design(grd_problem, search_method_name, frontier, prune_func,log_file, results_log_file)