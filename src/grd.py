__author__ = 'sarah'

from UMD import umd, constraint, search
import defs_apk, utils_apk, pddl_parser, utils

class GRD(umd.UMD):


    def __init__(self, initGR, constraints, design_file_name, design_problem_file_name, b_causal_graphs = True):
        super().__init__(initGR, constraints)
        self.design_file_name = design_file_name
        self.design_problem_name =  design_problem_file_name
        # used by the causal graph analysis
        if b_causal_graphs:
            self.causal_graphs = None

        self.utility = 'grd'

    def evaluate(self, GRmodel):
        [wcd, wcd_pair, max_wcd_all_pairs] = GRmodel.get_wcd() 
        return wcd

    def is_better(self, wcd_a, wcd_b):

        if wcd_a < wcd_b:
            return True
        else:
            return False

        # get the modifications that are applicable at the current node (disregarding the GRD constraints)

        # the possible modifications are either expressed in a design,pddl file (as transitions) or as implemented modificaitons
    def get_possible_modifications_(self, cur_node):
        
        # check if the pddl design file has been defined - otherwise raise an error
        if defs_apk.NA in self.design_file_name or self.design_file_name is None:
            print('encoded modifications not yet supported (and design file was not specified')
            raise NotImplementedError

        else:
            # get the successorss of the pddl class representation of the problem and design(!) domain
            pddl_successors = pddl_parser.get_pddl_successors(self.design_file_name, self.design_problem_name)


            modifications = []
            # the pddl operators are translated into modifications
            for operator, successor_state in pddl_successors:
                cur_modification = None
                #print('processing %s %s'%(operator,successor_state))
                #print('operator.name')
                #print(operator.name)
                cur_modification = utils_apk.pddl_to_modification(operator, successor_state)
                if cur_modification is not None and cur_node.state.is_valid(cur_modification):
                    modifications.append(cur_modification)


        return modifications
	

    def get_possible_modifications(self, cur_gr_node):

        # modifications+= self.get_information_sharing_modifications(cur_gr_model)

        modifications = self.get_possible_modifications_(cur_gr_node)

        node_sequence = cur_gr_node.transition_path()

        # remove the modifications that have been applied
        new_modificaitons = []
        for modification in modifications:
            mod_str = modification.__str__()
            if mod_str not in node_sequence:
                new_modificaitons.append(modification)


        return new_modificaitons

if __name__ == '__main__':

    # create goal recognition problem
    solver_path = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/src'
    domain_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/d.pddl'
    template_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/template.pddl'
    hyps_file_name = '/home/sarah/Documents/GoalRecognitionDesign/grd-agents-with-partial-observability/SharedFolder/partially_observable_grd/code/PRP/planner-for-relevant-policies/pond-benchmarks-sarah/wumpus-clg/wumpus-running-example-grd/example-small/hyps.dat'


    import gr_poa_prp
    gr_poa_problem = gr_poa_prp.GR_POA_PRP(solver_path, domain_file_name, template_file_name, hyps_file_name)

    constraints = [constraint.BudgetConstraint(0)]


    # create grd problem
    grd_poa_problem = GRD(gr_poa_problem, constraints)

    # create the frontier according to which nodes are extracted
    frontier = search.FIFOQueue()

    # perform design == minimize wcd
    import design
    design.best_first_design(grd_poa_problem, frontier)

