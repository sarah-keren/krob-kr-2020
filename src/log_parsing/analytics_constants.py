

SOLVE_RECORDS = ['has_solution','number_of_planner_calls','number_of_assumptions','plan_length','opop_plan_length','calc_time']
NODE_RECORDS = ['explored_count','cur_node','node_eval_time','cur_value','best_node','best_value','pre_prune_succ_count','prun_func_time','succ_count','succ_calc_time']

KEY_VAL_SEP = [':','=']

METADATA = ['instance_id','pruning','compilation','planner_type']
S = ':'

AVERAGES_TO_COMPUTE = ['number_of_planner_calls','number_of_assumptions','plan_length', 'opop_plan_length','calc_time']
RESPECTIVE_LABELS = ['avg. planner calls', 'avg. assumptions', 'avg. plan length', 'avg. opop. plan length', 'avg. calc time']

COMPILATIONS = ['kp','kprudent','kprudent-high']
PLANNERS = ['fd:hmaxcachetrans']
PRUNING = ['None']

NUM_HYPS = '1'
# # The parameters wanted for each budget
# RECORDS = ['cur_value', 'calc_time', 'explored']
# # default values for cases where budget parameters are not found
# DEFAULT_VALUES = [0, 0, 0]
# # The structure of the keys: for example, this creates three layer map { [Design domain]: [heuristic]: [value_for-k]: records }
# STRUCTURE = ['Designing domain','planner','compilation','pruning', 'heuristic', 'budget']
# RECORD_KEYWORDS = ['value_for_cost-0', 'value_for_cost-1', 'value_for_cost-2']
# # The index of the iterative records in the structure map
# INDEX_TO_REPLACE = 5 # need to figure out what this does, set to index of budget in structure

# ## When we want to parse total:
# TOTAL_KEY_VAL_SEP = ':'
# TOTAL_RECORDS = ['Total_best_value', 'explored', 'cost','ex_terminated', 'time']
# TOTAL_KEYWORD = 'Total'
# TOTAL_KEYLIST = ['Designing domain', 'planner', 'compilation', 'pruning', 'heuristic']
# # INDEX_TO_REPLACE = None

# # For analyzing results:
# AVERAGES_TO_COMPUTE = ['time','explored','wcd_reduction']
# RESPECTIVE_LABELS = ['average time','average nodes evaluated','average wcd reduction']
# # AVERAGES_TO_COMPUTE = ['cur_value', 'calc_time', 'explored', 'wcd_reduction', 'Total_best_value']
# # RESPECTIVE_LABELS = ['average value', 'average time', 'average nodes evaluated', 'average wcd reduction', 'average total best value']

# # Compute averages where ex_terminated is False
# FLAGS = {'ex_terminated': 'False', 'cost_greater_than_0': 'True'}
# FLAG_LABELS = [' for completed', ' for cost > 0']

# # Index of exterminated
# INDEX_OF_FLAG_IN_RESULTS = 3
# INDEX_OF_TOTAL_BEST_VALUE = 0

# #HEURISTICS = ['zero', 'db', 'multi_db', 'NA']
# HEURISTICS = ['NA']
# PRUNING = ['NA']
# PLANNERS = ['fd:eagergreedyff', 'fd:hmaxnocachetrans','fd:hmaxcachetrans','fd:hmaxnocache']
# COMPILATIONS = ['kp', 'kprudent']
