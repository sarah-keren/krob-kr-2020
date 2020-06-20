__author__ = 'sarah'

import gr
import utils_apk, defs_apk, solver_kp,poa_kp
import os, sys
import copy
import modification_apk
import logging

class GR_POA_KP(gr.GR,poa_kp.POA_KP):

    """Goal Recognition superclass
       supporting COMPLETE
    """
    def __init__(self, solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation, get_assumptions=True, get_opop_plan=True):

        gr.GR.__init__(self)
        poa_kp.POA_KP.__init__(self,solver_path, domain_file_name, template_file_name, hyps_file_name,planner_type, compilation, get_assumptions, get_opop_plan)


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

        modified_model = GR_POA_KP(solver_path,domain_file_name,template_file_name,hyps_file_name,self.planner_type, self.compilation, self.get_assumptions, self.get_opop_cost)
        return modified_model


    # find the wcd of the current node
    # hyps_indices - soecifies the specific indices to consider
    # cleanup - should files be delted after calculation
    def get_wcd(self, hyps_indices=None):


        # generate problem files
        [self.hyps, problem_files] = utils_apk.generate_problem_files(self.template_file_name, self.hyps_file_name, defs_apk.get_gen_folder_name())

        # make sure the problem files are unique to each node by changing their name
        #self.problem_files = []
        #for file in problem_files:
        #    temp_file = os.path.splitext(os.path.basename(self.template_file_name))[0]
        #    temp_file = temp_file.replace('template','')
        #    mod_name = '%s--%s.pddl' % (file,temp_file)
        #    os.rename(file, mod_name)
        #    self.problem_files.append(mod_name)


        # get the list of hyps
        hyps_set_calc = hyps_indices
        if hyps_indices is None:
            hyps_set_calc  = list(range(0,len(self.hyps)))

        # calculate the policy for each hyp
        self.get_policy_graphs(hyps_set_calc,problem_files)

        if self.policy_graphs is None or len(self.policy_graphs) < len(self.hyps):
            return [defs_apk.ERROR_WCD, None , None]

        # find all pairs
        all_pairs = utils_apk.get_all_pairs(hyps_set_calc, False)

        # find the maximal common trajectory between all pairs of policies
        max_wcd_all_pairs = []
        wcd = -1
        wcd_pair = None
        for pair in all_pairs:
            graph_0 = self.policy_graphs[pair[0]]
            graph_1 = self.policy_graphs[pair[1]]
            if graph_0 is None or graph_1 is None:
                cur_wcd_node = None
                cur_wcd = -1
                max_wcd_all_pairs.append([pair, cur_wcd_node, cur_wcd])
            else:
                # get the common prefix (not considering failure steps - where the agents decides to abort execution)
                [cur_wcd_node, cur_wcd] = utils_apk.get_maximal_common_prefix_lists(graph_0,graph_1,False)
                max_wcd_all_pairs.append([pair, cur_wcd_node, cur_wcd])
            if cur_wcd > wcd :
                wcd_pair = pair
                wcd = cur_wcd


        return [wcd, wcd_pair, max_wcd_all_pairs]

    def clean_up(self):
        # TODO SARAH: this is a temp solution, make cleanup cleaner
        if defs_apk.get_gen_folder_name() in self.template_file_name:
            os.remove(self.template_file_name)

    def recognize(self, observation):
        # COMPLETE
        return None




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







