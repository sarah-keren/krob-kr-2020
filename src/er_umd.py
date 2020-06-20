__author__ = 'sarah'

from UMD import umd, constraint, search, design
import pddl_parser, utils_apk, defs_apk
# TODO: Extend umd.UMD
class ER_UMD(umd.UMD):

    """Equireward Design Superclass
    """
    def __init__(self, initial_model, constraints, design_file_name, design_problem_file_name, b_causal_graphs = True,  b_design_values_table = True):
        self.initial_model = initial_model
        self.constraints = constraints   
        self.design_file_name = design_file_name
        self.design_problem_name =  design_problem_file_name
        # used by the causal graph analysis
        if b_causal_graphs:
            self.causal_graphs = None
        # used by the simplified design heuristic
        if b_design_values_table:
            self.design_values_table = {}

        self.utility = 'er-umd'

    # we assume nodes that are evlauated are valid - so there is no need here to check for validity
    def evaluate(self, model):
        cost = model.get_cost()
        return cost

    def is_better(self, cost_a, cost_b):
        if cost_a < cost_b:
            return True
        else:
            return False


    # the possible modifications are either expressed in a design,pddl file (as transitions) or as implemented modificaitons
    def get_possible_modifications(self, cur_node, remove_duplicates=True):
        
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
                if cur_modification is not None and cur_node.state.is_valid(cur_modification) :
                    if remove_duplicates:
                        cur_node_sequence = cur_node.__repr__()
                        cur_modification_str = cur_modification.__str__()
                        if cur_modification in modifications or cur_modification_str in cur_node_sequence:
                            continue
                    modifications.append(cur_modification)


        return modifications


class TerminationCriteriaOptimalValueHelpful(design.TerminationCriteria):

    def __init__(self, optimal_value, orSmaller=True):
        self.optimal_value = optimal_value
        self.orSmaller = orSmaller

    def isTerminal(self, node, node_value):

        # if the best possible value is reached - stop the search
        if self.orSmaller:
            if node_value <= self.optimal_value:
                return True
        else:  # or bigger
            if node_value >= self.optimal_value:
                return True
        # if FO-cost is achieved for all goals - stop the search
        if node.state.is_FO_value_Reached():
            return True

        return False


class TerminationCriteriaReachalbeGoals(design.TerminationCriteria):

        def __init__(self, optimal_value, orSmaller=True):
            self.optimal_value = optimal_value
            self.orSmaller = orSmaller

        def isTerminal(self, node, node_value):
            if node_value == 0:
                return True
            else:
                return False



        def __str__(self):
            raise NotImplementedError










