__author__ = 'sarah'

import gr
import utils, defs, solver_prp
import os, sys
import copy
import modification


class GR_POA_PRP(gr.GR):

    """Goal Recognition superclass
       supporting COMPLETE
    """
    def __init__(self, solver_path, domain_file_name, template_file_name, hyps_file_name):
        super().__init__()
        self.solver_path = os.path.abspath(solver_path)
        self.domain_file_name = os.path.abspath(domain_file_name)
        self.template_file_name = os.path.abspath(template_file_name)
        self.hyps_file_name = os.path.abspath(hyps_file_name)


        # generate problem files
        [self.hyps, self.problem_files] = utils.generate_problem_files(self.template_file_name, hyps_file_name)

        # parse the template file to find recognizer's knowldedge
        [self.rec_knowledge, self.agent_knowledge] = self.process_knowledge(self.template_file_name)
    

    '''
        Parse the template file to get all the knowledge items of the recognition system
    '''
    def process_knowledge(self, template_file_name):

        if not os.path.exists(template_file_name):
            print('Error in process_rec_knowledge : File %s does not exist'%template_file_name)
            return None

        # open file and read it
        template_file = open(template_file_name, "r")
        template_file_lines = template_file.readlines()
        template_file.close()

        # read all lines from the template file and copy them to the problem file, except for the <hyp> line which is replaced by hyp
        rec_knowledge = []
        agent_knowledge = []
        lines_count = len(template_file_lines)
        index = 0
        while index < lines_count:
            line = template_file_lines[index]
            if defs.REC_KNOW_STRING in line:
                index = index + 1
                line = template_file_lines[index]
                while defs.AGENT_KNOW_STRING not in line:                    
                    rec_knowledge.append(line[line.find("(")-1+1:line.find(")")+1])
                    index = index+ 1
                    line = template_file_lines[index]                                          

                # we are here with agent know string
                index = index + 1
                line = template_file_lines[index]            
                while defs.HYPS_STRING not in line:
                    agent_knowledge.append(line[line.find("(")-1+1:line.find(")")+1])
                    index = index+ 1                    
                    line = template_file_lines[index]    

                                        
            index += 1
                   
        #print('rec and agent knowledge')
        #print(rec_knowledge)
        #print(agent_knowledge)
    
        return [rec_knowledge, agent_knowledge]

    '''
        get the policy graph of the hyps in the set by invoking the PRP planner
    '''
    def get_policy_graphs(self,hyps_set_calc):

        policy_graphs = []

        for hyp_index in hyps_set_calc :

            cur_problem_file = self.problem_files[hyp_index]


            policy_file = solver_prp.solve(self.solver_path, self.domain_file_name, cur_problem_file, hyp_index)
       

            cur_graph = utils.get_policy_graph(policy_file)
            [cur_state_map, projected_state_map] = utils.get_state_map(policy_file,'rec')
            #print('projected state map for agent %d'%hyp_index)
            #print(projected_state_map)
            policy_graphs.append([cur_graph, cur_state_map,projected_state_map])


        return policy_graphs

    # find the wcd of the current node
    def get_wcd(self, hyps_indices=None):

        # get the list of hyps
        hyps_set_calc = hyps_indices
        if hyps_indices is None:
            hyps_set_calc  = list(range(0,len(self.hyps)))

        # calculate the policy for each hyp
        self.policy_graphs = self.get_policy_graphs(hyps_set_calc)

        # find all pairs
        all_pairs = utils.get_all_pairs(hyps_set_calc, False)

        # find the maximal common trajectory between all pairs of policies
        max_wcd_all_pairs = []
        wcd = 0
        wcd_pair = None
        for pair in all_pairs:
            graph_0 = self.policy_graphs[pair[0]]
            graph_1 = self.policy_graphs[pair[1]]
            [cur_wcd_node, cur_wcd] = utils.get_maximal_common_prefix_dot_files(graph_0,graph_1)
            max_wcd_all_pairs.append([pair, cur_wcd_node, cur_wcd])
            if cur_wcd > wcd :
                wcd_pair = pair
                wcd = cur_wcd

        return [wcd, wcd_pair, max_wcd_all_pairs]

    def recognize(self, observation):
        # COMPLETE
        return None

    # TODO SARAH : make sure to create a class of modifications and a subclass of information sharing modificaitons


def test_wcd():

    

    solver_path = '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    domain_file_name = '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/current/colorballs-test/domain.pddl'
    template_file_name = '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/current/colorballs-test/template.pddl'
    hyps_file_name = '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/current/colorballs-test/hyps.dat'


    #print('currnet directory')
    #import os
    #print(os.getcwd())


    gr_poa_problem = GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)
    [wcd, wcd_pair, max_wcd_all_pairs] = gr_poa_problem.get_wcd()
    print('wcd is %d'%wcd)
    #gr_poa_problem.get_modifications()

def test_modifications():

    # get gr model
    solver_path = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/src'
    domain_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/d.pddl'
    template_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/template.pddl'
    hyps_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/hyps.dat'
    gr_poa_problem = GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)


    inf_mod = modification.InformationShapingModification('not wumpus-at p1-1')
    modified_model = inf_mod.apply(gr_poa_problem)
    print(modified_model.template_file_name)

def calc_wcd():

    # clean the gen folder
    if os.path.exists(defs.get_gen_folder_name()):
        shutil.rmtree(defs.get_gen_folder_name())
    os.makedirs(defs.get_gen_folder_name())


    solver_path = sys.argv[1]#'/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    domain_file_name = sys.argv[2]#'/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/d.pddl'
    template_file_name = sys.argv[3]#'/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/template.pddl'
    hyps_file_name = sys.argv[4]#'/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/benchmarks/grd-apo/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/wumpus05/hyps.dat'

    #print('currnet directory')
    #import os
    #print(os.getcwd())

    gr_poa_problem = GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)
    [wcd, wcd_pair, max_wcd_all_pairs] = gr_poa_problem.get_wcd()
    print('wcd is %d'%wcd)
    #gr_poa_problem.get_modifications()


if __name__ == '__main__':
    #test_wcd()
    #test_modifications()
    calc_wcd()
    







