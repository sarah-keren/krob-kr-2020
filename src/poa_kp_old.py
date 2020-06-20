__author__ = 'sarah'

import gr
import utils, defs, solver_kp
import os, sys
import copy
import modification


class POA_KP():

    """Goal Recognition superclass
       supporting COMPLETE
    """
    def __init__(self, solver_path, domain_file_name, template_file_name, hyps_file_name):

        super().__init__()

        # the decision making mechanism of the agent
        self.solver_path = os.path.abspath(solver_path)

        # the 3 files that represent the goal recognition setting
        self.domain_file_name = os.path.abspath(domain_file_name)
        self.template_file_name = os.path.abspath(template_file_name)
        self.hyps_file_name = os.path.abspath(hyps_file_name)

        # parse the template file to find recognizer's knowldedge
        self.rec_knowledge = utils_apk.process_knowledge(self.template_file_name)

    # create a modified model according to the modification
    def create_modified_model(self, modified_element, modified_file):

        solver_path = self.solver_path
        domain_file_name = self.domain_file_name
        template_file_name = self.template_file_name
        hyps_file_name = self.hyps_file_name


        if defs.TEMPLATE_FILE in modified_element:
            template_file_name = modified_file

        elif defs.DOMAIN_FILE in modified_element:
            domain_file_name = modified_file

        elif defs.HYPS_FILE in modified_element:
            hyps_file_name = modified_file

        modified_model = POA_KP(solver_path,domain_file_name,template_file_name,hyps_file_name)
        return modified_model


    '''
        get the policy graph of the hyps in the set by invoking the PRP planner
    '''
    def get_policy_graph(self, problem_file):
        plan = solver_kp.solve(self.solver_path, self.domain_file_name, problem_file, defs.FF, 0)
        print(plan)
        return plan

    # find the wcd of the current node
    # hyps_indices - soecifies the specific indices to consider
    # cleanup - should files be delted after calculation
    def get_cost(self, hyps_indices=None):

        # generate problem file for hyps
        [_, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())

        # calculate policy for hyp
        self.policy_graph = self.get_policy_graph(problem_files[0])

        return len(self.policy_graph)

    def is_valid(self, cur_modification):

        #if this is an iformationshaping modificaiton, we need to make sure the information is consistent with the true state
        if modification.InformationShapingModification.__name__ in cur_modification.__class__.__name__:

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
        if defs.get_gen_folder_name() in self.template_file_name:
            os.remove(self.template_file_name)


def calc_cost():

    import shutil
    # clean the gen folder
    if os.path.exists(defs.get_gen_folder_name()):
        shutil.rmtree(defs.get_gen_folder_name())
    os.makedirs(defs.get_gen_folder_name())

    # parse input
    solver_path = sys.argv[1]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    domain_file_name = sys.argv[2]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/d.pddl'
    template_file_name = sys.argv[3]#e,g, '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/template.pddl'
    hyps_file_name = sys.argv[4]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/hyps.dat'


    # create the goal recognition problem
    poa_problem = POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name)

    # get the wcd
    cost = poa_problem.get_cost()
    print('cost is %d'%cost)


if __name__ == '__main__':
    #test_wcd()
    #test_modifications()
    calc_cost()
    







