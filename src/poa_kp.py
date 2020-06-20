__author__ = 'sarah'

import gr
import utils_apk, defs_apk, solver_kp,solver_fd
import os, sys
import copy
import modification_apk
import logging


class POA_KP:

    """
        supporting COMPLETE
    """
    def __init__(self, solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation, get_assumptions=True, get_opop_plan=True, get_fo_cost=True, fo_plans=[]):

        # the decision making mechanism of the agent
        self.solver_path = os.path.abspath(solver_path)

        # the 3 files that represent the goal recognition setting
        self.domain_file_name = os.path.abspath(domain_file_name)
        self.template_file_name = os.path.abspath(template_file_name)
        self.hyps_file_name = os.path.abspath(hyps_file_name)

        # parse the template file to find recognizer's knowldedge
        self.rec_knowledge = utils_apk.process_knowledge(self.template_file_name)

        self.planner_type = planner_type

        self.get_assumptions = get_assumptions
        self.get_opop_cost = get_opop_plan
        self.get_fo_cost = get_fo_cost

        self.compilation = compilation

        self.opop_plans = []
        self.fo_plans = fo_plans
        self.po_plans = []
        self.belief_states = []

    '''
        get the policy graph of the hyps in the set by invoking the PRP planner
    '''
    def get_policy_graphs(self, hyps_set_calc, problem_files):

        policy_graphs = []
        assumption_sets = []
        self.number_of_planner_calls = []
        self.planner_calls = []

        for hyp_index in hyps_set_calc:
            logging.info('Getting get_PO_cost: index:%d' % (hyp_index))
            cur_problem_file = problem_files[hyp_index]
            [po_plan, has_solution_po, po_plan_cost, number_of_planner_calls, assumptions, opop_plan, has_solution_opop, opop_plan_cost,belief_states ] = solver_kp.solve(self.solver_path, self.domain_file_name, cur_problem_file, self.planner_type,
                                       hyp_index, self.compilation, True, self.get_assumptions, self.get_opop_cost)
            assumption_sets.append(assumptions)
            self.belief_states.append(belief_states)


            if po_plan is not None:
                policy_graphs.append(po_plan)
                # update opop and po plans
                self.po_plans.append([po_plan, has_solution_po, po_plan_cost])
                self.opop_plans.append([opop_plan, has_solution_opop,opop_plan_cost])


            if self.get_fo_cost and self.fo_plans == []:
                # logging.info('InMethod get_FO_cost: index:%d, fo_problem_file_name:%s' % (index, fo_problem_file_name))
                logging.info('Getting get_FO_cost: index:%d' % (hyp_index))
                [fo_plan, fo_has_solution, fo_plan_cost, number_of_planner_calls_FO, assumptions,belief_states_FO] = solver_kp.get_FO_cost(self.solver_path, self.domain_file_name, cur_problem_file, self.planner_type, hyp_index, self.compilation, True, self.get_assumptions)
                #[fo_plan, fo_has_solution, number_of_planner_calls, assumptions] = self.get_FO_cost(self.domain_file_name, cur_problem_file)

                # update fo plans
                self.fo_plans.append([fo_plan, fo_has_solution,fo_plan_cost])

        self.policy_graphs = policy_graphs
        self.number_of_planner_calls.append(number_of_planner_calls)


        # keep the assumptions that will be used for analyzing this instance
        if self.get_assumptions:
            self.assumption_sets = assumption_sets


    def get_problem_files(self):

        # generate problem files
        [self.hyps, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())
        return problem_files

    def get_compiled_files(self):

        # generate problem files
        [self.hyps, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())

        hyp_index = 0
        compiled_files = []
        for cur_problem_file in problem_files:
            [compiled_domain, compiled_problem] = solver_kp.get_compiled_files(self.solver_path, self.domain_file_name, cur_problem_file, self.planner_type, hyp_index, self.compilation)
            compiled_files.append([compiled_domain,compiled_problem])
            hyp_index += 1

        return compiled_files

    def is_valid(self, cur_modification):

        #if this is an iformationshaping modificaiton, we need to make sure the information is consistent with the true state
        if modification_apk.InformationShapingModification.__name__ in cur_modification.__class__.__name__:

            if cur_modification.neg_predicate is not None:
                pred = cur_modification.neg_predicate.replace(')', '')
                pred = pred.replace('(', '')

                # conveying false negative information
                if pred in self.rec_knowledge:
                    return False

            if cur_modification.predicate is not None:
                pred = cur_modification.predicate.replace(')', '')
                pred = pred.replace('(', '')

                # conveying false positive information
                if pred not in self.rec_knowledge:
                    return False

        return True

    def clean_up(self):
        # TODO SARAH: this is a temp solution, make cleanup cleaner
        if defs_apk.get_gen_folder_name() in self.template_file_name:
            os.remove(self.template_file_name)

    # used by the termination criteria to decide whether the search can stop
    def is_FO_value_Reached(self):

        results_per_hyps = []
        if self.fo_plans == [] or self.po_plans == []:
            return False
        else:

            for fo_plan_info, po_plan_info,opop_plan_info in zip(self.fo_plans,self.po_plans, self.opop_plans):
                [fo_plan, fo_has_solution, fo_cost] = fo_plan_info
                [po_plan, po_has_solution, po_cost] = po_plan_info
                [opop_plan, opop_has_solution, opop_cost] = opop_plan_info

                # if the optimisitc-optimal plan doesn't have a solution - the actor is following the best approach- since there is not solution
                if not opop_has_solution:
                    results_per_hyps.append(True)

                if fo_has_solution:
                    if po_has_solution:
                        if po_cost == fo_cost:
                            results_per_hyps.append(True)
                        else:
                            results_per_hyps.append(False)
                    else:
                        results_per_hyps.append(False)
                else: #fo_has_solution == False
                    if po_has_solution:
                        results_per_hyps.append(False)
                    else:
                        results_per_hyps.append(True)

            # if there is at least one False - we return false
            for result in results_per_hyps:
                if not result: # negative results
                    return False
            return True




def calc_wcd():

    import shutil
    # clean the gen folder
    if os.path.exists(defs_apk.get_gen_folder_name()):
        shutil.rmtree(defs_apk.get_gen_folder_name())
    os.makedirs(defs_apk.get_gen_folder_name())

    # parse input
    solver_path = sys.argv[1]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    domain_file_name = sys.argv[2]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/d.pddl'
    template_file_name = sys.argv[3]#e,g, '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/template.pddl'
    hyps_file_name = sys.argv[4]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/hyps.dat'
    compilation = sys.argv[5]

    # create the goal recognition problem
    gr_poa_problem = GR_POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name, compilation)


    # get the wcd
    [wcd, wcd_pair, max_wcd_all_pairs] = gr_poa_problem.get_wcd()
    print('wcd is %d'%wcd)



if __name__ == '__main__':
    #test_wcd()
    #test_modifications()
    calc_wcd()







