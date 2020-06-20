import os
import utils_apk
import defs_apk
import logging
import time

def solve(solver_path, domain_file_name, problem_file_name, planner_type,index, compilation, consider_intermediate_plan= True, get_assumptions=True, get_op_op_plan=False, rename_files = 'PO', read_beliefs=True):

    start_time = time.time()

    solution_file_path = os.path.join(defs_apk.get_gen_folder_name(),'kp_output_%s_%d_%s.txt'%(rename_files,index,compilation))

    if defs_apk.FD.lower() in planner_type.split(':')[0].lower():
        planner_path = defs_apk.FD_PATH;

    elif defs_apk.FF.lower() in planner_type.split(':')[0].lower():
        planner_path = defs_apk.FF_PATH;


    cmd = ' %s/k-replanner %s %s --planner-path  %s --keep-intermediate-files --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s  --planner %s --compilation %s > %s ' %(solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(),planner_type,compilation, solution_file_path)

    print('cmd solver k-replanner:')
    print(cmd)
    print('cwd')
    print(os.getcwd())
    number_of_planner_calls = 0

    utils_apk.run(cmd, solver_path)
    if defs_apk.KAC_COMPILATION in compilation:
        [plans, has_solution] = read_optimistic_plans(solution_file_path)
        [po_plan,po_plan_cost] = plans[0]
        po_has_solution = has_solution

    else:
        if (consider_intermediate_plan):
            [po_plan, po_has_solution, number_of_planner_calls, po_plan_cost] = read_plan_with_intermediate_steps(solution_file_path)
            po_has_solution = is_successful_plan(po_plan)
        else:
            [po_plan, po_plan_cost] = read_succesful_plan(solution_file_path)
            po_has_solution = is_successful_plan(po_plan)

    opop_plans = None
    opop_plan_cost = 0
    opop_succesful = False
    if (get_op_op_plan):
        [opop_plans, has_solution] = read_optimistic_plans(solution_file_path)
        [first_plan,first_plan_cost] = opop_plans[0]
        opop_succesful = is_successful_plan(first_plan)

    assumptions = None
    number_of_assumptions = 0
    if get_assumptions:
        [assumptions, number_of_assumptions] = parse_assumptions(solution_file_path)

    belief_states = None
    if read_beliefs:
        belief_states = parse_beliefs(solution_file_path)


    #if rename_files is not None:
    #    #os.rename(solution_file_path,'%s%s%s%s_%s.%s'%(solution_file_path.split('.')[0],time.time(),planner_type,rename_files,compilation,solution_file_path.split('.')[1]))
    #    os.rename(solution_file_path, '%s%s%s_%s.%s' % (solution_file_path.split('.')[0], planner_type, rename_files, compilation, solution_file_path.split('.')[1]))

    calc_time = time.time() - start_time
    logging.info('InMethod solve: index:%d, has_solution:%s, number_of_planner_calls:%d, number_of_assumptions:%d, plan_length:%d, opop_plan_length=%d, calc_time=%.2f' % (index, po_has_solution, number_of_planner_calls, number_of_assumptions, po_plan_cost, opop_plan_cost, calc_time))
    logging.debug(compilation)
    logging.debug('po_plan')
    logging.debug(po_plan)
    logging.debug('opop_plans')
    logging.debug(opop_plans)
    return [po_plan, po_has_solution, po_plan_cost, number_of_planner_calls, assumptions, opop_plans, opop_succesful, opop_plan_cost, belief_states]



def get_FO_cost(solver_path, domain_file_name, po_problem_file_name, planner_type,index, compilation, consider_intermediate_plan= True, get_assumptions=True):

    fo_problem_file_name = utils_apk.po_to_fo_problem_file(po_problem_file_name, True, False)
    fo_domain_file_name = utils_apk.po_to_fo_domain_ack_file(domain_file_name, False)

    #[plan, has_solution, number_of_planner_calls, assumptions, opop_plan, opop_plan_has_solution] = solve(solver_path, fo_domain_file_name, fo_problem_file_name, planner_type, index, defs_apk.KAC_COMPILATION, consider_intermediate_plan, get_assumptions,get_op_op_plan = False, rename_files = 'FO')
    planner_type = defs_apk.FO_PLANNER
    [plan, has_solution, plan_cost, number_of_planner_calls, assumptions, opop_plan, opop_plan_has_solution, opop_plan_cost, belief_states] = solve(solver_path, fo_domain_file_name,fo_problem_file_name, planner_type, index, defs_apk.KAC_COMPILATION, consider_intermediate_plan, get_assumptions, get_op_op_plan=False, rename_files='FO')
    logging.debug('getting fo plan')
    return [plan, has_solution, plan_cost, number_of_planner_calls, assumptions, belief_states]

def get_FO_cost_old(solver_path, domain_file_name, po_problem_file_name, planner_type,index, compilation, consider_intermediate_plan= True, get_assumptions=True):

    fo_problem_file_name = utils_apk.po_to_fo_problem_file(po_problem_file_name, False)
    fo_domain_file_name = domain_file_name

    [plan, has_solution, number_of_planner_calls, assumptions, opop_plan, opop_plan_has_solution] = solve(solver_path, fo_domain_file_name, fo_problem_file_name, planner_type, index, compilation, consider_intermediate_plan, get_assumptions,get_op_op_plan = False, rename_files = 'FO')
    return [plan, has_solution, number_of_planner_calls, assumptions]




def get_FO_cost_old(solver_path, domain_file_name, po_problem_file_name, planner_type,index, compilation, consider_intermediate_plan= True, get_assumptions=True):

    fo_problem_file_name = utils_apk.po_to_fo_problem_file(po_problem_file_name, False)
    fo_domain_file_name = domain_file_name

    [plan, has_solution, number_of_planner_calls, assumptions, opop_plan, opop_plan_has_solution] = solve(solver_path, fo_domain_file_name, fo_problem_file_name, planner_type, index, compilation, consider_intermediate_plan, get_assumptions,get_op_op_plan = False, rename_files = 'FO')
    return [plan, has_solution, number_of_planner_calls, assumptions]

def get_compiled_files(solver_path, domain_file_name, problem_file_name, planner_type,index, compilation, get_original_init = True):

    planner_path = defs_apk.get_planner_path(planner_type)

    solution_file_path = os.path.join(defs_apk.get_gen_folder_name(), 'kp_output_%d.txt' % index)
    cmd = ' %s/k-replanner %s %s --planner-path  %s --keep-intermediate-files --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw,kp:print:raw --tmpfile-path %s --planner %s --compilation %s> %s ' % (solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(), planner_type,compilation, solution_file_path)

    print('cmd:')
    print(cmd)
    print('cwd')
    print(os.getcwd())

    utils_apk.run(cmd, solver_path)

    # Find the generated files and change their names
    parsed_domain_file_name = 'parsed_domain_%d.pddl' % index
    parsed_problem_file_name = 'parsed_problem_%d.pddl'%index

    # find a files with the gen-d*.pddl and gen-p*.pddl and change their names
    file_pattern = 'gen-d'
    domain_file_name = None
    for file in os.listdir(defs_apk.get_gen_folder_name()):
        if file.startswith(file_pattern):
            domain_file_name = file
            os.rename(os.path.join(defs_apk.get_gen_folder_name(),domain_file_name),os.path.join(defs_apk.get_gen_folder_name(),parsed_domain_file_name))
            break


    file_pattern =   'gen-p'
    problem_file_name = None
    for file in os.listdir(defs_apk.get_gen_folder_name()):
        if file.startswith(file_pattern):
            problem_file_name = file
            os.rename(os.path.join(defs_apk.get_gen_folder_name(),problem_file_name),os.path.join(defs_apk.get_gen_folder_name(),parsed_problem_file_name))
            break
    if get_original_init:
        original_init = read_original_initial_state(solution_file_path)

        #inject the init into the parsed_problem_file_name file
        parsed_problem_file = open(os.path.join(defs_apk.get_gen_folder_name(),parsed_problem_file_name), "r")
        lines = parsed_problem_file.readlines()
        parsed_problem_file.close()

        new_file_lines = []
        for line in lines:
            if '(:init' in line:
                init_line = '(:init'
                if defs_apk.FD in planner_type:
                    init_line += '(= (total-cost) 0)\n'

                init_line+=original_init
                init_line += ')\n'
                new_file_lines.append(init_line)
            else:
                new_file_lines.append(line)
        parsed_problem_file = open(os.path.join(defs_apk.get_gen_folder_name(), parsed_problem_file_name), "w")
        parsed_problem_file.writelines(new_file_lines)
        parsed_problem_file.close()


    return [os.path.join(defs_apk.get_gen_folder_name(),parsed_domain_file_name),os.path.join(defs_apk.get_gen_folder_name(),parsed_problem_file_name)]

def read_original_initial_state(solution_file_path):
    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    index = 0
    while index < len(lines):
        #read the initial state
        if '>>> initial state={' in lines[index]:
            init_state = lines[index]
            init_state = init_state.replace('>>>> initial state={', '')
            init_state = init_state.replace('>>> initial state={','')

            init_state = init_state.replace('}', '')
            return init_state
        else:
            index +=1

def is_time_out(solution_file_path):
    timed_out = True
    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    for line in solution_file.readlines():
        if 'after calling planner':
            timed_out = False
            break
    return timed_out


def read_plan_with_intermediate_steps(solution_file_path, only_first = False):

    timed_out = is_time_out(solution_file_path)

    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    plan = []
    plan_cost = 0
    has_solution = True

    number_of_planner_calls = 0
    for line in lines:

        if 'before calling planner' in line:
            number_of_planner_calls+=1
            if number_of_planner_calls >1 and only_first:
                return [plan, False, number_of_planner_calls, plan_cost]

        if 'parse error' in line:
            has_solution = False
            number_of_planner_calls = defs_apk.INFINITE
            break


        if 'unable to solve problem' in line or 'problem has no solution!' in line:
            has_solution = False
            plan.append(defs_apk.FAILURE_STRING)
            break

        if 'kp-action=' in line:
            action = line.split()[1]
            action = action.split('=')[1]
            if not 'reach_new_goal_through_original_goal' in action:
                plan.append(action)
                plan_cost+=1
    print('plan:')
    print(plan)

    if timed_out:
        plan_cost = defs_apk.TIMEOUT

    return [plan, has_solution, number_of_planner_calls, plan_cost]

def read_optimistic_plans(solution_file_path, consider_ka_actions = False):
    timed_out = is_time_out(solution_file_path)
    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    plans = []
    has_solution = False
    plan_cost = 0
    index = 0
    plan = None
    while index < len(lines):
        if 'Classical plan (reduced):' in lines[index]:
            plan = []
            index += 1
            has_solution = True
            cur_line = lines[index]
            while 'step' in cur_line:
                if not 'reach_new_goal_through_original_goal' in cur_line:
                    if not consider_ka_actions and defs_apk.KAC_COMPILATION in cur_line:
                        # 'kac actions are not counted in the plan cost')
                        plan.append(cur_line.split('.')[1].replace('\n', ''))

                    else:
                        plan.append(cur_line.split('.')[1].replace('\n',''))
                        plan_cost += 1
                    index = index+1
                    cur_line = lines[index]
                # end of current plan
                else:
                    # append current plan to the list of optimistic plans
                    if plan is not None:
                        plans.append([plan,plan_cost])
                    break

        index += 1

    if timed_out:
        plan_cost = defs_apk.TIMEOUT
    return [plans, has_solution]


def read_succesful_plan(solution_file_path):

    timed_out = is_time_out(solution_file_path)

    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    plan = []
    plan_cost = 0
    reading_plan = False
    has_solution = True
    for line in lines:
        #start reading the plan
        if 'PLAN:' in line:
            line = line.replace('PLAN:','')
            reading_plan = True
        if 'stats:' in line:
            break
        if 'problem has no solution!' in line:
            has_solution = False
            break
        if reading_plan:
            action = line.split(':')[1]
            action = action.replace('\n','')
            if not 'reach_new_goal_through_original_goal' in action:
                plan.append(action)

    if timed_out:
        plan_cost = defs_apk.TIMEOUT
    if has_solution:
        print('plan is %s'%plan)
        return [plan, plan_cost]
    else:
        print('there is no solution')
        return [None,plan_cost]

def parse_beliefs(solution_file_path):

    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    beliefs = []
    index=0
    while index < len(lines):
        if ">>>>" in lines[index]:
            parsed_belief = lines[index]
            parsed_belief = parsed_belief.replace('>>>> initial state=','')
            parsed_belief = parsed_belief.replace('>>>> state=', '')
            beliefs.append(parsed_belief)
            index += 1
        else:
            index+=1
    return beliefs
def parse_assumptions(solution_file_path):

    # open solution path and read lines
    solution_file = open(solution_file_path, "r")
    lines = solution_file.readlines()
    assumptions = []
    assumptions_count = 0
    reading_asssumptions = False
    index=0
    while index < len(lines):
        if 'Assumptions' in lines[index]:
            index += 1
            cur_assumptions = []
            #start reading assumptions
            while 'step=' in lines[index]:
                assumptions_string = (lines[index].split(': ')[1]).replace('\n','')
                assumptions_string = assumptions_string.replace('{','')
                assumptions_string = assumptions_string.replace('}', '')
                cur_assumption_list = assumptions_string.split(',')
                cur_assumptions.append(cur_assumption_list)
                assumptions_count += len(cur_assumption_list)
                index += 1
            assumptions.append(cur_assumptions)
        else:
            index+=1

    return [assumptions, assumptions_count]

def is_successful_plan(plan):

    if plan is None:
        return False
    if len(plan) == 0:
        return False
    if defs_apk.FAILURE_STRING in plan[-1]:
        return False
    return True



def kp_solve():

    import shutil
    import sys
    import os

    # clean the gen folder
    #if os.path.exists(defs_apk.get_gen_folder_name()):
    #    shutil.rmtree(defs_apk.get_gen_folder_name())
    #os.makedirs(defs_apk.get_gen_folder_name())

    # parse input
    solver_path = sys.argv[1]
    solver_path = os.path.abspath(solver_path)
    domain_file_name = os.path.abspath(sys.argv[2])
    template_file_name = os.path.abspath(sys.argv[3])
    hyps_file_name = os.path.abspath(sys.argv[4])

    cwd = os.getcwd()
    print('cwd')
    print(cwd)
    print('\n\nsolver path')
    print(solver_path)

    # generate problem files
    [hyps, problem_files] = utils_apk.generate_problem_files(template_file_name, hyps_file_name, defs_apk.get_gen_folder_name())
    planner_path = os.path.abspath('./solvers/FF-v2.3')
    plan = solve(solver_path, domain_file_name, problem_files[0], planner_path, 0)
    print('plan is: ')
    print(plan)

    plan = solve(solver_path, domain_file_name, problem_files[1], planner_path, 1)
    print('plan is: ')
    print(plan)


def solve_deprecated(solver_path, domain_file_name, problem_file_name, planner_type,index, compilation, consider_intermediate_plan= True, get_assumptions=True, get_op_op_plan=False, rename_files = 'PO'):

    start_time = time.time()

    solution_file_path = os.path.join(defs_apk.get_gen_folder_name(),'kp_output_%d_%s.txt'%(index,compilation))
    #cmd = ' %s/k-replanner %s %s --planner-path  %s --keep-intermediate-files --tmpfile-path %s > %s '%(solver_path, domain_file_name, problem_file_name,planner_path,defs.GEN_FOLDER,solution_file_path)
    #cmd = ' %s/k-replanner %s %s --planner-path  %s  --tmpfile-path %s > %s ' % (solver_path, domain_file_name, problem_file_name, planner_path, defs.GEN_FOLDER, solution_file_path)
    #cmd = ' %s/k-replanner %s %s --planner-path  %s   --keep-intermediate-files --tmpfile-path %s > %s ' %(solver_path, domain_file_name, problem_file_name, planner_path, defs.GEN_FOLDER, solution_file_path)
    #cmd = ' %s/k-replanner %s %s --planner-path  %s  --tmpfile-path %s > %s ' % ( solver_path, domain_file_name, problem_file_name, planner_path, defs.GEN_FOLDER, solution_file_path)

    #if defs_apk.FF.lower() in planner_type.split(':')[0].lower():
    #    planner_path = defs_apk.FF_PATH;
    #    #cmd = ' %s/k-replanner %s %s --planner-path  %s --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s --keep-intermediate-files > %s ' %(solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.GEN_FOLDER, solution_file_path)
    #    #cmd = ' %s/k-replanner %s %s --planner-path  %s --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s --keep-intermediate-files > %s ' % ( solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.GEN_FOLDER, solution_file_path)
    #    cmd = ' %s/k-replanner-no-costs %s %s --planner-path  %s --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s > %s '%(solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(), solution_file_path)
    #elif defs_apk.FD.lower() in planner_type.split(':')[0].lower():
    #    planner_path = defs_apk.FD_PATH;
    #    #./k-eplanner domain.pddl problem_1.pddl --keep-intermediate-files--planner -path / home / sarah / Documents / gitrepos / UtilityMaximizingDesign / solvers / Fast - Downward - -options = solver:print: assumptions, solver: print:steps, kp: print:raw, kp: print:preprocessed - -planner fd
    #    cmd = ' %s/k-replanner-costs %s %s --planner-path  %s --keep-intermediate-files --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s  --planner %s > %s ' %(solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(),planner_type, solution_file_path)

    if defs_apk.FD.lower() in planner_type.split(':')[0].lower():
        planner_path = defs_apk.FD_PATH;

    elif defs_apk.FF.lower() in planner_type.split(':')[0].lower():
        planner_path = defs_apk.FF_PATH;

    print('planner_path:')
    print(planner_path)
    print('planner_type:')
    print(planner_type)


    #cmd = ' %s/k-replanner-%s %s %s --planner-path  %s --keep-intermediate-files --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw,kp:print:raw --tmpfile-path %s  --planner %s > %s ' %(solver_path, compilation, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(),planner_type, solution_file_path)

    cmd = ' %s/k-replanner %s %s --planner-path  %s --keep-intermediate-files --options=solver:print:steps,solver:print:assumptions,solver:print:fired-sensors,planner:print:plan,planner:print:plan:raw --tmpfile-path %s  --planner %s --compilation %s > %s ' %(solver_path, domain_file_name, problem_file_name, planner_path, defs_apk.get_gen_folder_name(),planner_type,compilation, solution_file_path)



    print('cmd solver k-replanner:')
    print(cmd)
    print('cwd')
    print(os.getcwd())

    utils_apk.run(cmd, solver_path)

    if (consider_intermediate_plan):
        [plan, has_solution, number_of_planner_calls] = read_plan_with_intermediate_steps(solution_file_path)
    else:
        [plan, has_solution, number_of_planner_calls] = read_succesful_plan(solution_file_path)

    opop_plan = None
    opop_plan_length = 0
    assumptions = None
    number_of_assumptions = 0
    if (get_op_op_plan):
        opop_plan = read_optimistic_plan(solution_file_path)
    if get_assumptions:
        [assumptions, number_of_assumptions] = parse_assumptions(solution_file_path)

    plan_cost = defs_apk.INFINITE
    if plan is not None:
        [plan_cost, has_solution] = get_plan_cost(plan)
    if len(plan) == 1 and defs_apk.FAILURE_STRING in plan[0]:
        plan_cost = 0
        has_solution = False

    if rename_files is not None:
        #os.rename(solution_file_path,'%s%s%s%s_%s.%s'%(solution_file_path.split('.')[0],time.time(),planner_type,rename_files,compilation,solution_file_path.split('.')[1]))
        os.rename(solution_file_path, '%s%s%s_%s.%s' % (solution_file_path.split('.')[0], planner_type, rename_files, compilation, solution_file_path.split('.')[1]))

    calc_time = time.time() - start_time
    logging.info('InMethod solve: index:%d, has_solution:%s, number_of_planner_calls:%d, number_of_assumptions:%d, plan_length:%d, opop_plan_length=%d, calc_time=%.2f' % (index, has_solution, number_of_planner_calls, number_of_assumptions, plan_cost, opop_plan_length, calc_time))
    return [plan, has_solution, number_of_planner_calls, assumptions, opop_plan]





