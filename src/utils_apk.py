__author__ = 'sarah'

import os, sys
import defs_apk
import resource
#import dot_parser
import itertools
import modification_apk

from utils_ai import FIFOQueue

# clean the gen folder
import shutil
import logging

def initialize_logging(log_file_name):
    logging.basicConfig(filename=log_file_name,format='%(asctime)s %(message)s',level=logging.INFO)
    #logging.info('Processing_input for instance %s'%instance_id)


def get_domain_id(domain_path):
    split_domain_path = domain_path.split('/')
    print(split_domain_path)
    #domain_id = split_domain_path[len(split_domain_path)-4] + '---'+split_domain_path[len(split_domain_path)-3]
    domain_id = split_domain_path[len(split_domain_path)-5:len(split_domain_path)-2]
    sep = defs_apk.SEPARATOR_STRING
    domain_id = sep.join(domain_id)
    #milli_time_stamp = int(round(time.time()))
    #domain_id= '%s___%d'%(domain_id,milli_time_stamp)
    return domain_id


def get_instance_id(domain_path, hyp_path):
    split_domain_path = domain_path.split('/')
    print(split_domain_path)
    instance_id = split_domain_path[len(split_domain_path)-5:len(split_domain_path)-1]
    sep = defs_apk.SEPARATOR_STRING
    instance_id = sep.join(instance_id)

    split_hyp_path = hyp_path.split('/')
    print(split_hyp_path)
    hyp_id = split_hyp_path[len(split_hyp_path)-1]
    #sep = defs_apk.SEPARATOR_STRING
    #hyp_id = sep.join(hyp_id)

    instance_id+='-'+hyp_id

    return instance_id

def generate_problem_files(template_file_name, hyps_file_name, destination_folder_name):

    # make sure the destination folder exists
    if not os.path.exists(destination_folder_name):
        os.mkdir(destination_folder_name)

    if not os.path.exists(template_file_name):
        print('Error in generate_problem_files : File %s does not exist'%template_file_name)
        return None

    if not os.path.exists(hyps_file_name):
        print('Error in generate_problem_files : File %s does not exist'%hyps_file_name)
        return None

    template_file = open(template_file_name, "r")
    template_file_lines = template_file.readlines()


    hyps_file = open(hyps_file_name, "r")
    hyps = []
    lines = hyps_file.readlines()
    for line in lines:
        hyp = line.replace('\n', '')
        hyps.append(hyp)


    hyp_index = 0
    hyp_files = []
    for hyp in hyps:

        # the newly generated problem file
        problem_file_name = os.path.join(destination_folder_name,'problem_%d.pddl'%hyp_index)
        problem_file = open(problem_file_name, "w")

        # read all lines from the template file and copy them to the problem file, except for the <hyp> line which is replaced by hyp
        for line in template_file_lines:
            if defs.HYPS_STRING in line:
                problem_file.write('%s\n'%defs.HYPS_STRING)
                problem_file.write(hyp)
            else:
                problem_file.write(line)

        problem_file.close()
        print(problem_file_name)
        hyp_files.append(problem_file_name)
        hyp_index += 1

    return [hyps,hyp_files]


def generate_problem_files(template_file_name, hyps_file_name, destination_folder_name):

    # make sure the destination folder exists
    if not os.path.exists(destination_folder_name):
        os.mkdir(destination_folder_name)

    if not os.path.exists(template_file_name):
        print('Error in generate_problem_files : File %s does not exist'%template_file_name)
        return None

    if not os.path.exists(hyps_file_name):
        print('Error in generate_problem_files : File %s does not exist'%hyps_file_name)
        return None

    template_file = open(template_file_name, "r")
    template_file_lines = template_file.readlines()


    hyps_file = open(hyps_file_name, "r")
    hyps = []
    lines = hyps_file.readlines()
    for line in lines:
        hyp = line.replace('\n', '')
        hyps.append(hyp)


    hyp_index = 0
    hyp_files = []
    for hyp in hyps:

        # the newly generated problem file
        problem_file_name = os.path.join(destination_folder_name,'problem_%d.pddl'%hyp_index)
        problem_file = open(problem_file_name, "w")

        # read all lines from the template file and copy them to the problem file, except for the <hyp> line which is replaced by hyp
        for line in template_file_lines:
            if defs_apk.HYPS_STRING in line:
                problem_file.write('%s\n'%defs_apk.HYPS_STRING)
                problem_file.write(hyp)
            else:
                problem_file.write(line)

        problem_file.close()
        print(problem_file_name)
        hyp_files.append(problem_file_name)
        hyp_index += 1

    return [hyps,hyp_files]

def get_design_sequence_key(node):
    print(node)
    modification_sequence = node.transition_path()
    simplified_sequence_key = ''
    for mod in modification_sequence:
        simplified_mod = mod[:mod.rfind('_')]
        if simplified_mod not in simplified_sequence_key:
            simplified_sequence_key+=simplified_mod
    print(modification_sequence)
    print(simplified_sequence_key)
    return simplified_sequence_key

def get_simplified_mod(modification):

    simplified_mod = modification.__str__()[:modification.__str__().rfind('_')]
    return simplified_mod

def get_simplified_design_sequence(node):

    # get the modification sequence
    mod_seq =node.transition_path_modifications()

    # get all the possible modifications that can be applied
    all_mods = node.umd_problem.get_possible_modifications(node)

    # for each modificaiton in mod_set, get all the modificaitons that have the same key
    # and append them to the simplified design sequence
    simplified_sequence = []
    for mod_cur in mod_seq:
        simplified_sequence.append(mod_cur)
        mod_cur_key = get_simplified_mod(mod_cur)
        for mod in all_mods:
            mod_key = get_simplified_mod(mod)
            if mod_key == mod_cur_key:
                simplified_sequence.append(mod)

    return simplified_sequence



class Log:
    SILENT = 0
    FILE = 0x1
    SCREEN = 0x2
    BOTH = FILE | SCREEN
    def __init__(self, filename=None):
        self.name = filename
        self.has_file = filename is not None
        if self.has_file:
            self.file = open(filename, "w")
    def write(self, string):
        sys.stdout.write(string)
        if self.has_file:
            self.file.write(string)
    def suspend(self):
        if self.has_file:
            self.file.close()
            del self.file
        sys.stdout.flush()
    def resume(self):
        if self.has_file:
            self.file = open(self.name, "a")
    def __call__(self, mode):
        if mode == Log.SILENT:
            return SilentWriter()
        elif mode == Log.SCREEN or not self.has_file:
            return sys.stdout
        elif mode == Log.FILE:
            return self.file
        else:
            return self

class SilentWriter:
    def write(self, string):
        pass

def run(cmd, running_dir= None,  timeout= defs_apk.DEFAULT_TIME_LIMIT, memory = 2048, log=None, verbose=True):
    """Runs a command using os.system(), restricting time and space
    resources, preventing core dumps and redirecting the output
    (both stdout and stderr) into a log file (if log is not None).

    Parameters:
      cmd     - shell command to be executed
      timeout - timeout in CPU seconds
      memory  - maximum heap size allowed in Megabytes
      log     - the log file (of class benchmark.Log)
      verbose - If true, also print the heap and time restrictions,
                the return code of the program and elapsed time.
                If false, this info is logged if there is a log,
                but not printed.

    Return Value: (signal, time)
      signal  - 0 if the program terminated properly, non-zero otherwise.
      time    - time spent for executing the program in seconds.
                Note that this is *not* CPU time but usertime and might thus
                exceed the timeout threshold.
    """

    time_slack = 5

    log_mode = Log.SILENT
    if verbose:
        log_mode |= Log.SCREEN
    if log:
        cmd = "(%s) >> %s 2>&1" % (cmd, log.name)
        log_mode |= Log.FILE
    if not log:
        log = Log()

    if verbose :
        print (log(log_mode), "Timeout: %d seconds" % timeout)
        print (log(log_mode), "Heap restriction: %d MB" % memory)
        print (log(log_mode), "Command: %s" % cmd)
        print (log(log_mode))

    memory *= 1024 * 1024
    log.suspend()

    time_passed_before = os.times()[2] + os.times()[3]
    pid = os.fork()
    if not pid:
        resource.setrlimit(resource.RLIMIT_CPU, (timeout - time_slack, timeout))
        # resource.setrlimit(resource.RLIMIT_DATA, (memory, memory))
        # resource.setrlimit(resource.RLIMIT_RSS, (memory, memory))
        resource.setrlimit(resource.RLIMIT_AS, (memory, memory))
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))

        # get current dir and change it if requested
        cur_running_dir = os.getcwd()
        if running_dir != None:
    
            os.chdir(running_dir)

        # execute command
        signal = os.system(cmd)

        # change back to the original current directory
        if running_dir != None:
            os.chdir(cur_running_dir)

        if signal % 256 == 0:
            os._exit(signal // 256)
        os._exit(signal % 256)

    signal = os.waitpid(pid, 0)[1]

    log.resume()
    time_passed = (os.times()[2] + os.times()[3]) - time_passed_before

    if signal == 0:
        if verbose :
            print (log(log_mode), "\nTime spent: %.3f seconds" % time_passed)
    else:
        if verbose :
            print (log(log_mode), "\nFailed! [Signal %d, Time %.3f seconds]" \
                  % (signal, time_passed))

    return signal, time_passed

def get_policy_graph(graph_file_name):

    graph_file = open(graph_file_name, 'r')
    graph_string = graph_file.read()
    graph = dot_parser.parse_dot_data(graph_string)
    print(graph)
    return graph[0]



# TODO SARAH : Support partial states !
def get_state_map(policy_file_name, projection=None):
    """Given a policy file - return the state map and the projected state map (states containing only predicates with the projection string)

    Parameters:
      policy_file_name - file name containing the policy 
      projection - the string that identifies the predicates the recognition system is aware of
   
    Return Value: [state_map, projected_state_map]
      state_map  - the original state map
      projected_state_map  - the state map seen my the recognition system 
    """
    # get the graph from the dot file
    graph_file = open(policy_file_name, 'r')
    file_content = graph_file.read()
    map_string = file_content.split('The state map:\n--------------\n')[1]
    map_string = map_string.replace(',\n}','\n}')
    map_string = map_string.replace('\n','')

    # convert it into a map
    state_map = eval(map_string)

    projected_state_map ={}
    if projection is not None:
        for key in state_map.keys():
            val = state_map[key]
            val_list = val.split('()')
            val_list = val_list[:-1]        

            # create a partial state with only the vars that include the projected value
            projected_val = []
            for val in val_list:
                #print('val is %s\n'%val)                
                if projection in val and 'NegatedAtom' not in val and 'k_not' not in val :                    
                    projected_val.append(val)
             
            # add the value to the map
            #print(projected_val)
            if len(projected_val) == 0:
                projected_state_map[key] = defs_apk.NON_OBS_STATE_STRING
            else:
                projected_state_map[key] = ','.join(projected_val)
        '''print('debug-------------------------------------->>>>')
        print(state_map)
        print('00000000000000000000000000000000000000000000000000')
        print(projected_state_map)
        print('**************************************************************')'''
        return [state_map, projected_state_map]


def get_all_pairs(list_to_pair,b_ordered):

    if b_ordered:
        perm=  itertools.permutations(range(len(list_to_pair)), 2)
        return perm
    else:
        comb=  itertools.combinations(range(len(list_to_pair)), 2)
        return comb

# TODO SARAH : Do we want to support entailement here ?
def is_equal_state(state_0_id,state_1_id, id_state_map_0, id_state_map_1, special_label):
    

    # deal with the nil node
    if special_label in state_0_id or special_label in state_1_id:
        if special_label in state_0_id and special_label in state_1_id:
            return True
        else:
            return False

    # get the maps representing each state
    state_0 = id_state_map_0[int(state_0_id)]
    state_1 = id_state_map_1[int(state_1_id)]
 
    for elem in state_0:
        if elem not in state_1:
            return False
 
    return True

def get_successors_nodes(node_id, graph):

    successor_nodes = []
    det_nodes = []
    for edge in (graph.obj_dict['edges']):
        #node_name = (node[0])['name']
        if node_id == edge[0]:
            
            next_node = edge[1]
            next_node_label = ((((graph.obj_dict['nodes'])[next_node])[0])['attributes'])['label']
            #print('nodedddd:::: %s label::: %s'%(next_node,next_node_label))
            if 'DET' in next_node_label:
                det_nodes.append(next_node)
            
            else:
                successor_nodes.append(next_node)
    
    for det_node_id in det_nodes:
        for edge in (graph.obj_dict['edges']):
            #node_name = (node[0])['name']
            if det_node_id == edge[0]:
                next_node = edge[1]
                successor_nodes.append(next_node)
                
            
    return successor_nodes



def get_successors_nodes_original(node_id, graph):

    successor_nodes = []
    for edge in (graph.obj_dict['edges']):
        #node_name = (node[0])['name']
        if node_id == edge[0]:
            
            next_node = edge[1]
            next_node_label = ((((graph.obj_dict['nodes'])[next_node])[0])['attributes'])['label']
            print('node:::: %s label::: %s'%(next_node,next_node_label))
            
            successor_nodes.append(next_node)

    return successor_nodes
# ______________________________________________________________________________
# adopted from the code by Russel&Norvig code


'''
def get_successors_nodes(node_id, graph):
    
    successor_nodes = []
    sensor_nodes = []
    for edge in (graph.obj_dict['edges']):
        #node_name = (node[0])['name']
        if node_id == edge[0]:
            next_node = edge[1]
            # ignore sensing actions - and take the non-sensing successors of the sensing node
            next_node_label = ((((graph.obj_dict['nodes'])[next_node])[0])['attributes'])['label']
            print('node:::: %s label::: %s'%(next_node,next_node_label))
            if 'sensor' in next_node_label:                
                sensor_node = next_node
                sensor_nodes.append(sensor_node)
            else:    
                successor_nodes.append(next_node)
    
    #add the succsrros of the sensor nodes
    for sensor_node_id in sensor_nodes:
        for edge in (graph.obj_dict['edges']):
            if sensor_node_id == edge[0]:
                next_node_s = edge[1]
                successor_nodes.append(next_node_s)

              
                
    return successor_nodes

'''
class PolicyTreeNode:

    """A node in a search tree. Contains a pointer to the parent (the node
    that this is a successor of) and to the actual state for this node. Note
    that if a state is arrived at by two paths, then there are two nodes with
    the same state.  Also includes the action that got us to this state, and
    the total path_cost (also known as g) to reach the node.  Other functions
    may add an f and h value; see best_first_graph_search and astar_search for
    an explanation of how the f and h values are handled. You will not need to
    subclass this class."""

    def __init__(self, state_a, state_b, parent, action_a=None, action_b=None, path_cost=0):
        """Create a search tree Node, derived from a parent by an action."""
        self.state = [state_a,state_b]

        self.parent = parent

        self.action_a = action_a
        self.action_b = action_b

        self.path_cost = path_cost

        self.depth = 0

        if parent:
            self.depth = parent.depth + 1

    def __repr__(self):
        return "<Node {}>".format(self.state)

    def __lt__(self, node):
        return self.state < node.state

    def expand(self, problem):
        """List the nodes reachable in one step from this node."""
        return [self.child_node(problem, action)
                for action in problem.actions(self.state)]

    def child_node(self, problem, action):
        """[Figure 3.10]"""
        next = problem.result(self.state, action)
        return PolicyTreeNode(next, self, action,
                    problem.path_cost(self.path_cost, self.state,
                                      action, next))

    def solution(self):
        """Return the sequence of actions to go from the root to this node."""
        return [node.action for node in self.path()[1:]]

    def path(self):
        """Return a list of nodes forming the path from the root to this node."""
        node, path_back = self, []
        while node:
            path_back.append(node)
            node = node.parent
        return list(reversed(path_back))


    # We want for a queue of nodes in breadth_first_search or
    # astar_search to have no duplicated states, so we treat nodes
    # with the same state as equal. [Problem: this may not be what you
    # want in other contexts.]

    def __eq__(self, other):
        return isinstance(other, PolicyTreeNode) and self.state == other.state

    def __hash__(self):
        #print('in hash with node')
        #print(self)
        #state_a = (self.state[0][0])['name']
        #state_b = (self.state[1][0])['name']
        #hash_code = hash(''.join(state_a)+' - '+''.join(state_b))

        hash_code = hash(self.state[0]+ '-' + self.state[1])
    
        return hash_code

# TODO SARAH: Deal with loops
def get_maximal_common_prefix_dot_files(graph_A, graph_B,init_node_label = '_nil',  max_horizon = defs_apk.DEFAULT_MAX_HORIZON):

    [dot_graph_0,id_map_A,projected_map_0] = graph_A
    [dot_graph_1,id_map_B,projected_map_1] = graph_B

    # get first node
    init_node_A = (dot_graph_0.obj_dict['nodes'])[init_node_label]
    init_node_B = (dot_graph_1.obj_dict['nodes'])[init_node_label]

    # get the root node for traversal
    root_node = PolicyTreeNode(init_node_label,init_node_label, None)

    wcd = 0
    max_node = root_node
    
    print('projected map 0')
    print(projected_map_0)
    print('projected map 1')
    print(projected_map_1)

    
     
    # we check whether the states are equal according to the projected map (!), i.e. from the point of view of the recognition system
    if not is_equal_state(init_node_label,init_node_label,projected_map_0,projected_map_1,init_node_label):
        return [max_node,wcd]

    #start traversal until the most distant eqaul state is found   
    frontier = FIFOQueue()
    frontier.append(root_node)
    explored = set()
    
    # we keep an iteration counter to deal with circles
    iteration_count = 0
    while frontier and iteration_count< max_horizon:
        
        iteration_count = iteration_count+1
        
        # extract node (that represents both graphs)
        node = frontier.pop()
        wcd = node.depth
        explored.add(node.__hash__())
        print('exploring node:: ')
        print(node)
        children_0 = get_successors_nodes(node.state[0],dot_graph_0)
        print('children 0')
        print(children_0)
        children_1 = get_successors_nodes(node.state[1],dot_graph_1)
        print('children 1')
        print(children_1)
        for child_0 in children_0:
            exists = False
            for child_1 in children_1:
                if is_equal_state(child_0,child_1,projected_map_0,projected_map_1,init_node_label):
                    exists = True
                    break
            if exists:
                new_node = PolicyTreeNode(child_0, child_1, node)
                if new_node not in explored:
                    frontier.append(new_node)
    
    # we reduce the wcd by one - since the empty (nil) node at the root is not part of our tree
    wcd = wcd-1 
    
    return[max_node,wcd]



def get_maximal_common_prefix_lists(list_A, list_B, consider_failure_as_inf = False):

    common_prefix = []
    common_failure = False
    for item_A, item_B in zip(list_A, list_B) :
        if item_A in item_B :
            if defs_apk.FAILURE_STRING in item_A and defs_apk.FAILURE_STRING in item_B:
                common_failure = True
            common_prefix.append(item_A)
        else:
            break
    if common_failure and consider_failure_as_inf:
        return [common_prefix, defs_apk.INFINITE]
    else:
        return [common_prefix, len(common_prefix)]


def get_plan_cost(plan, consider_failure_as_inf = False):

    plan_prefix = []
    isFailed = False
    for item in plan :
        if defs_apk.FAILURE_STRING in item:
            isFailed = True
            if consider_failure_as_inf:
                return [defs_apk.INFINITE, plan_prefix, isFailed]
            else:
                return [len(plan_prefix),plan_prefix, isFailed]
        else:
            plan_prefix.append(item)
    return [len(plan_prefix), plan_prefix, isFailed]


def sequences_to_sets (sequence):
    parsed_set = set(sequence)
    return  parsed_set



def add_predicate_to_init_state_pddl(predicate, template_file_name, mod_template_file_name):


    template_file = open(template_file_name, "r")
    template_file_lines = template_file.readlines()
    template_file.close()

    new_file_lines = []
    knowledge_line_already_exists = False
    for line in template_file_lines:
        
        if 'Added knowledge' in line:
            knowledge_line_already_exists = True
            new_file_lines.append(line + '\n' + predicate +'\n')
                        
        elif defs_apk.ADDED_PREDICATES_STRING in line and not knowledge_line_already_exists:
            new_file_lines.append(line+'\n ;;; Added knowledge\n' + predicate+ '\n')
            
        else:            
            new_file_lines.append(line)

    # the newly generated problem file
    modified_template_file = open(mod_template_file_name, "w")
    modified_template_file.writelines(new_file_lines)
    modified_template_file.close()
    #print('mod_template_file_full_name:%s'%mod_template_file_name)


def pddl_to_modification (operator, successor_state):


        if defs_apk.INFORMATION_SHAPING_STRING in operator.name:
            #print('which is an information shaping modificaiton')
            #print(operator.add_effects)
            positive_info = None
            negative_info = None
            if len(operator.add_effects) != 0:
                positive_info = list(operator.add_effects)[0]
            if len(operator.del_effects) != 0:
                negative_info = list(operator.del_effects)[0]

            cur_modification = modification_apk.InformationShapingModification(positive_info,negative_info)
            #print('current modification is')
            #print(cur_modification)
            return cur_modification


 # get the padded sequenece of the modification in question
 # done by taking the modifications that for the key_indices agree on the value of the params
def get_padded_sequence(modification, design_node, key_indices):

    params = modification_apk.get_params()

    # assert validity
    for key in key_indices:
        assert key <= len(params)


    # get possible modifications
    possible_modifications = design_node.umd_problem.get_possible_modifications(design_node)

    padded_sequence = []
    # remove the invalid modifications and those that are not of the same type as modification
    for cur_modification in possible_modifications:

        # verify cur_modification is valid
        if not design_node.state.is_valid(cur_modification):
            continue

        # verify cur_modification is of the same type as modification
        if cur_modification.__class__.__name__ not in modification.__class__.__name__:
            continue

        # verify cur_modification agrees with modification on the values
        cur_params = cur_modification.get_params()
        b_valid = True
        for key in key_indices:
            if cur_params[key] != params[key]:
                b_valid = False
                continue

        if b_valid:
            padded_sequence.append(cur_modification)

    return padded_sequence



def empty_or_create_log_and_gen_dir():

    if os.path.exists(defs_apk.get_gen_folder_name()):
        shutil.rmtree(defs_apk.get_gen_folder_name())
    if not os.path.exists(defs_apk.get_gen_folder_name()):
        os.makedirs(defs_apk.get_gen_folder_name())

    if not os.path.exists(defs_apk.get_log_folder_name()):
        # shutil.rmtree(defs_apk.RES_FOLDER)
        os.makedirs(defs_apk.get_log_folder_name())


def part_to_full_obs_problem(part_obs_file_name, full_obs_file_name):

    part_obs_file = open(part_obs_file_name, "r")
    part_obs_file_lines = part_obs_file.readlines()
    part_obs_file.close()

    full_obs_file = open(full_obs_file_name, "w")

    new_file_lines = []
    ivariant_reading = False
    hidden_reading = False
    for line in part_obs_file_lines:

        if not ivariant_reading and 'invariant' not in line and not hidden_reading:
            new_file_lines.append(line)

        elif 'invariant' in line and not ivariant_reading:
            ivariant_reading = True
            #new_file_lines.append(')\n')
            continue

        elif ivariant_reading and not '(:hidden' in line:
            continue

        elif ivariant_reading and '(:hidden' in line:
            ivariant_reading = False
            hidden_reading = True
            continue

        elif hidden_reading and 'end_hidden' not in line:
            new_file_lines.append(line)

        elif hidden_reading and 'end_hidden' in line:
            new_file_lines.append(line)
            hidden_reading = False
            continue

    # the newly generated problem file
    full_obs_file.writelines(new_file_lines)
    full_obs_file.close()


def part_to_full_obs_domain(part_obs_file_name, full_obs_file_name):

    part_obs_file = open(part_obs_file_name, "r")
    part_obs_file_lines = part_obs_file.readlines()
    part_obs_file.close()

    full_obs_file = open(full_obs_file_name, "w")

    new_file_lines = []
    sensor_reading = False
    for line in part_obs_file_lines:

        if '(:sensor' not in line and 'sense' not in line:
            new_file_lines.append(line)

        # we are assuming all sensor actions are at the end and can be ignored
        else:
            new_file_lines.append(')\n ;;; all sensing actions removed \n')
            break


    # the newly generated problem file
    full_obs_file.writelines(new_file_lines)
    full_obs_file.close()


def is_atom_in_list(atom_1, atom_list):

    if atom_1 is None:
        return False

    for list_atom in atom_list:

        parsed_latom = list_atom.replace('(','')
        parsed_latom = parsed_latom.replace(')', '')
        parsed_latom = parsed_latom.replace(',', '')
        parsed_latom = parsed_latom.replace(' ', '')
        parsed_latom = parsed_latom.replace('Negated', '')
        parsed_latom = parsed_latom.replace('_', '')

        parsed_atom_1 = atom_1.replace('(', '')
        parsed_atom_1 = parsed_atom_1.replace(')', '')
        parsed_atom_1 = parsed_atom_1.replace(',', '')
        parsed_atom_1 = parsed_atom_1.replace(' ', '')
        parsed_atom_1 = parsed_atom_1.replace('Negated', '')
        parsed_atom_1 = parsed_atom_1.replace('_', '')
       

        if parsed_atom_1 in parsed_latom:
            return True
    return False

def is_related_to(modification, action_name):
    if modification.action.object in action_name:
        return True
    else:
        return False

def generate_problem_files_deprecated(template_file_name, hyps_file_name, destination_folder_name):

    # make sure the destination folder exists
    if not os.path.exists(destination_folder_name):
        os.mkdir(destination_folder_name)

    if not os.path.exists(template_file_name):
        print('Error in generate_problem_files : File %s does not exist'%template_file_name)
        return None

    if not os.path.exists(hyps_file_name):
        print('Error in generate_problem_files : File %s does not exist'%hyps_file_name)
        return None

    template_file = open(template_file_name, "r")
    template_file_lines = template_file.readlines()

    hyps_file = open(hyps_file_name, "r")
    hyps = []
    lines = hyps_file.readlines()
    for line in lines:
        hyps.append(line.replace('\n',''))

    hyp_index = 0
    hyp_files = []
    for hyp in hyps:

        # the newly generated problem file
        problem_file_name = os.path.join(destination_folder_name,'problem_%d.pddl'%hyp_index)
        problem_file = open(problem_file_name, "w")

        # read all lines from the template file and copy them to the problem file, except for the <hyp> line which is replaced by hyp
        for line in template_file_lines:
            if defs_apk.HYPS_STRING in line:
                problem_file.write('%s\n'%defs_apk.HYPS_STRING)
                problem_file.write(hyp)
            else:
                problem_file.write(line)

        problem_file.close()
        print(problem_file_name)
        hyp_files.append(problem_file_name)
        hyp_index += 1

    return [hyps,hyp_files]


    '''
        Parse the template file to get all the knowledge items of the recognition system
    '''
def process_knowledge( template_file_name):

    if not os.path.exists(template_file_name):
        print('Error in process_rec_knowledge : File %s does not exist' % template_file_name)
        return None

    # open file and read it
    template_file = open(template_file_name, "r")
    template_file_lines = template_file.readlines()
    template_file.close()

    # read all lines from the template file and copy them to the problem file, except for the <hyp> line which is replaced by hyp
    rec_knowledge = []
    lines_count = len(template_file_lines)
    index = 0
    while index < lines_count:
        line = template_file_lines[index]
        if 'hidden' in line:
            index = index + 1
            line = template_file_lines[index]
            while ';; end_hidden' not in line:
                line_info = line[line.find("(") - 1 + 1:line.find(")") + 1]
                line_info = line_info.replace(')', '')
                line_info = line_info.replace('(', '')
                #remove empty lines
                if len(line_info) >0:
                    rec_knowledge.append(line_info)
                index = index + 1
                line = template_file_lines[index]
            break

        index += 1

    #print('rec and agent knowledge')
    #print(rec_knowledge)

    return rec_knowledge

def po_to_fo_domain_ack_file(po_domain_file_name, add_costs):

    # open the original domain
    po_domain_file = open(po_domain_file_name, "r")
    lines = po_domain_file.readlines()
    po_domain_file.close()


    file_dot_location = po_domain_file_name.rfind('.')
    #fo_domain_file_name = po_domain_file_name[:file_dot_location] + '_fo' + po_domain_file_name[file_dot_location:]
    fo_domain_file_name = defs_apk.get_gen_folder_name() + '/domain_fo' + po_domain_file_name[file_dot_location:]
    fo_domain_file_name = ''.join(fo_domain_file_name)

    # delete files if it already exists
    if os.path.exists(fo_domain_file_name):
        os.remove(fo_domain_file_name)
    fo_domain_file = open(fo_domain_file_name, "a")

    index = -1
    knowledge_acq_actions = []
    reading_predicates = False
    add_paranthesis_after_predicates = False
    while index < len(lines)-1:

        index += 1
        cur_line = lines[index]
        # add a predicate of knowing each item and then an action that acquires that knowledge
        if 'predicates' in cur_line:

            fo_domain_file.write(cur_line)
            reading_predicates = True
            continue

        if reading_predicates and 'action' in cur_line :

            if add_paranthesis_after_predicates:
                fo_domain_file.write('\n)\n')

            if add_costs:
                # add function to support cost
                fo_domain_file.write('    (:functions (total-cost))\n')

            # add knowledge acquisition actions
            for action in knowledge_acq_actions:
                fo_domain_file.write(action)


            fo_domain_file.write('\n')
            reading_predicates = False

        # transform each predicate at the knowledge level
        if reading_predicates:


            if '))' in cur_line:
                cur_line = cur_line.replace('))', ')')
                add_paranthesis_after_predicates = True


            cur_line_chars = cur_line.replace(' ', '')
            cur_line_chars = cur_line_chars.replace('(', '')
            cur_line_chars = cur_line_chars.replace(')', '')
            cur_line_chars = cur_line_chars.replace('\n', '')

            # if the line is empty or contains only paranthesis skip it
            if len(cur_line_chars) == 0:
                fo_domain_file.write(cur_line)
            else:
                # print the predicate
                fo_domain_file.write(cur_line)
                # print the knwoledge predicate
                parsed_cur_line = cur_line.replace('(', '(kac_')
                fo_domain_file.write(parsed_cur_line)

                # get name and params
                first_space_par = cur_line.find('(')
                cur_line_name_and_params = cur_line[first_space_par:]
                cur_line_name_and_params =  cur_line_name_and_params.replace('(', '')
                cur_line_name_and_params =  cur_line_name_and_params.replace(')', '')
                cur_line_name_and_params = cur_line_name_and_params.replace('\n', '')
                if '?' in cur_line_name_and_params:
                    first_space_loc = cur_line_name_and_params.find(' ')
                    name = cur_line_name_and_params[:first_space_loc]
                    params = cur_line_name_and_params[first_space_loc:]
                    parsed_params_split = params.split('?')
                    parsed_params = ''
                    for par in parsed_params_split:
                        if par == '' or par == ' ':
                            continue
                        pos = par.find('-')
                        cur_param = par[:pos]
                        parsed_params += '?'+cur_param
                        parsed_params += ' '

                else:
                    name = cur_line_name_and_params
                    parsed_params = ''
                # add knowledge action to the list
                cost_string = ''

                if add_costs:
                    cost_string = '(increase(total-cost) 1))'

                cur_knowledge_acq_action = '\n   (:action act_kac_%s\n    :parameters (%s)\n    :precondition (kac_%s %s)\n   :effect(and(%s %s) %s))\n'%(name,params,name,parsed_params,name,parsed_params, cost_string)
                knowledge_acq_actions.append(cur_knowledge_acq_action)

        # not reading predicates
        else:
            fo_domain_file.flush()
            fo_domain_file.write(cur_line)

    fo_domain_file.close()
    return fo_domain_file_name


def po_to_fo_problem_file(po_problem_file_name, is_knowledge_acquisition=False, add_costs = False):

    true_state_knowledge = process_knowledge(po_problem_file_name)
    po_problem_file = open(po_problem_file_name, "r")
    lines = po_problem_file.readlines()

    file_dot_location = po_problem_file_name.rfind('.')
    fo_problem_file_name = po_problem_file_name[:file_dot_location]+'_fo'+po_problem_file_name[file_dot_location:]
    fo_problem_file_name = ''.join(fo_problem_file_name)

    #po_name = po_problem_file_name.split('.')
    #fo_problem_file_name = po_name[:-1]+['_fo.']+po_name[-1:]
    #fo_problem_file_name= ''.join(fo_problem_file_name)

    # delete files if it already exists
    if os.path.exists(fo_problem_file_name):
        os.remove(fo_problem_file_name)

    fo_problem_file = open(fo_problem_file_name, "a")
    index = 0
    while index < len(lines):
        cur_line = lines[index]
        if '(:hidden' in cur_line:
            while 'end_hidden' not in cur_line:
                index +=1
                cur_line = lines[index]
            index += 1
            fo_problem_file.write('(:hidden \n );;; end_hidden\n')
            if is_knowledge_acquisition and add_costs:
                fo_problem_file.write('\n(:metric minimize (total-cost))\n')


        else:
            if '(:init' in cur_line:
                fo_problem_file.write(cur_line)
                for info_item in true_state_knowledge:
                    if not is_knowledge_acquisition:
                        fo_problem_file.write('('+info_item+')')
                    else:
                        fo_problem_file.write('(kac_' + info_item + ')')
                    fo_problem_file.write('\n')

                if is_knowledge_acquisition and add_costs:
                    fo_problem_file.write('\n (=(total-cost) 0)\n')

            else:
                fo_problem_file.write(cur_line)
            index += 1

    fo_problem_file.close()
    return fo_problem_file_name


