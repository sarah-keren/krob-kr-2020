__author__ = 'sarah'

import gr
import utils_apk, defs_apk, solver_kp,poa_kp
import os, sys
import copy
import modification_apk
import logging

class ER_POA_KP(poa_kp.POA_KP):

    def __init__(self, solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation, get_assumptions=True, get_opop_plan=True, get_fo_cost=defs_apk.GET_FO_COST, fo_plans=[]):
        poa_kp.POA_KP.__init__(self,solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation, get_assumptions, get_opop_plan, get_fo_cost, fo_plans)
        self.max_plan_cost = defs_apk.INFINITE
        self.get_fo_cost = get_fo_cost

    # create a modified model according to the modification
    def create_modified_model(self, modified_element, modified_file):

        solver_path = self.solver_path
        domain_file_name = self.domain_file_name
        template_file_name = self.template_file_name
        hyps_file_name = self.hyps_file_name


        if defs_apk.TEMPLATE_FILE in modified_element:
            template_file_name = modified_file

        elif defs_apk.DOMAIN_FILE in modified_element:
            domain_file_name = modified_file

        elif defs_apk.HYPS_FILE in modified_element:
            hyps_file_name = modified_file


        # fo_plans of the original model are sent to the successor since they do not change, and shouldn't be re-computed
        modified_model = ER_POA_KP(solver_path,domain_file_name,template_file_name,hyps_file_name,self.planner_type, self.compilation, self.get_assumptions, self.get_opop_cost, self.get_fo_cost, self.fo_plans)
        return modified_model


    # find the value of the current node
    # hyps_indices - soecifies the specific indices to consider
    # cleanup - should files be delted after calculation
    def get_cost(self, hyps_indices=None):

        # generate problem files
        [self.hyps, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())

        # get the list of hyps
        hyps_set_calc = hyps_indices
        if hyps_indices is None:
            hyps_set_calc  = list(range(0,len(self.hyps)))

        # calculate the policy for each hyp
        self.get_policy_graphs(hyps_set_calc,problem_files)

        if self.policy_graphs is None or len(self.policy_graphs) < len(self.hyps):
            return [defs_apk.ERROR_COST, None , None]

        # if there is only one plan, get the cost of the first plan
        if self.get_fo_cost:
            plan_costs = []
            for po_plan, fo_plan in zip(self.po_plans,self.fo_plans) :
                # if there is one goal that is reachable but the agent can't reach it return infinite cost
                if fo_plan[1] and not po_plan[1]:
                    return defs_apk.INFINITE
            # all achievable goals are reachable, return 0
            return 0

        else:
            for po_plan in self.po_plans:
                # if there is one goal that is reachable but the agent can't reach it return infinite cost
                is_goal_achievable = po_plan[1]
                if not is_goal_achievable:
                    return defs_apk.INFINITE
            # all achievable goals are reachable, return 0
            return 0

    def get_cost_old(self, hyps_indices=None):

        # generate problem files
        [self.hyps, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())

        # get the list of hyps
        hyps_set_calc = hyps_indices
        if hyps_indices is None:
            hyps_set_calc  = list(range(0,len(self.hyps)))

        # calculate the policy for each hyp
        self.get_policy_graphs(hyps_set_calc,problem_files)

        if self.policy_graphs is None or len(self.policy_graphs) < len(self.hyps):
            return [defs_apk.ERROR_COST, None , None]

        # if there is only one plan, get the cost of the first plan
        plan_costs = []
        for plan in self.po_plans:
            # goal is unachievable
            if plan[1] is False:
                if plan[2]== defs_apk.TIMEOUT:
                    plan_costs.append(defs_apk.TIMEOUT)
                else:
                    plan_costs.append(defs_apk.INFINITE)
            else:
                plan_costs.append(plan[2])
        self.max_plan_cost = max(plan_costs)
        return self.max_plan_cost
    def clean_up(self):
        # TODO SARAH: this is a temp solution, make cleanup cleaner
        if defs_apk.get_gen_folder_name() in self.template_file_name:
            os.remove(self.template_file_name)


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







