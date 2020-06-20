import sys, os
import shutil
import random

'''
Create formatted design, design_domain, hyps, template & domain from a folder 
specficying problems & domain file
'''
ACTION_NAME = 'design-infoshaping-no-r-in-range'
PARAMETERS = '(?r - ROCK ?loc - LOCATION ?h - HEIGHT)'
PRECONDITION = '(and (design))'
EFFECT = '(and (not(in-range ?r ?loc ?h)))'
INIT_AGENT_PARAMS = ['adj','agent-at','antenna-height', 'not-sensing']


def format_action(action, params, precon, effect):
    string = '\t(:action %s \n\t :parameters %s \n \
    :precondition %s \n\t :effect %s \n\t)' % (action, params, precon, effect)
    return string

def format_goal(string_to_inject):
    string = '\t(:goal \n\t %s \n\t) \n' % string_to_inject
    return string

def format_hyps(s):
    # TODO Think of better way to do this
    all_possible = s.split("and", 1)[1].lstrip()[:-3]
    # split possible goals into list
    poss = [s+')' for s in all_possible.split(') ') if s]
    # format last element
    poss[-1] = poss[-1][:-1]
    random.shuffle(poss)

    i = random.randint(3,6)
    # take 6 random 
    hyps_1 = " ".join(poss[:i])
    random.shuffle(poss)
    i = random.randint(3,6)
    hyps_2 = " ".join(poss[:i])

    
    return "%s \n%s \n" % (hyps_1, hyps_2)

def write_template(problem_file, cur_path):
    template_file = open('%s/template.pddl' % cur_path, 'w')
    problem_file = open(problem_file, 'r')

    # Var to keep track of when parenthesis is closed for init & hidden
    paren_value = 0
    lines = problem_file.readlines()
    line_index = 1

    init_reached = False
    hidden_reached = False 

    while not init_reached:
        
        line = lines[line_index]
        if ':init' in line:
            init_reached = True

        template_file.write(line)
        line_index += 1
    
    paren = 1 

    # handle init
    while line_index < len(lines):
        line = lines[line_index]
        opens = line.count('(')
        closes = line.count(')') * -1
        paren += (opens + closes)

        if paren == 0:
            template_file.write('\t ;;; CHANGES\n')
            # close init
            break

        template_file.write(line)
        line_index += 1

    while len(lines) >= line_index:
        line = lines[line_index]
        if 'hidden' in line:
            break
        template_file.write(line)
        line_index += 1      

    paren = 0
    # handle hidden
    while line_index < len(lines):
        line = lines[line_index]
        opens = line.count('(')
        closes = line.count(')') * -1
        paren += (opens + closes)

        if paren == 0:
            template_file.write('\t );;; end_hidden\n')
            break

        template_file.write(line)
        line_index += 1

    # handle goal
    line_index += 1
    hyps = ''
    while line_index < len(lines):
        
        line = lines[line_index]
        if ':goal' in line:
            hyps = format_hyps(line)
            goal_str = format_goal('(and\n \t\t;;; HYPS <hyp>\n\t )')
            template_file.write(goal_str)
            break
        
        template_file.write(line)
        line_index += 1

    template_file.write(')\n')

    template_file.close()
    problem_file.close()
    return hyps

def write_hyps(hyps, cur_path):
    hyps_file = open('%s/hyps.dat' % cur_path, 'w')
    hyps_file.write(hyps)
    hyps_file.close()

    return


def write_domain(domain_file_path, problem_path):
    # copy domain file into the problem
    os.system('cp %s %s' % (domain_file_path, problem_path))
    return 

def write_design_problem(problem_file, cur_path):
    # TODO
    design_problem = open('%s/design_problem.pddl' % cur_path, 'w')
    problem_file = open(problem_file, 'r')

    init_reached = False
    for line in problem_file:
        if ':init' in line:
            design_problem.write(line)
            design_problem.write('\t\t(design)')
            init_reached = True

        elif ':hidden' in line:
            design_problem.write('\t)\n')
            break

        if init_reached and not any(param in line for param in INIT_AGENT_PARAMS):
            continue

        design_problem.write(line)
    
    goal_str = format_goal('(dummy-goal)')
    design_problem.write(goal_str)

    design_problem.write(')\n')
    design_problem.close()
    problem_file.close()
    return 

def write_design(domain_file, problem_path):
    design_file = open('%s/design.pddl' % problem_path, 'w')
    domain_file = open(domain_file, 'r')

    for line in domain_file:
        design_file.write(line)
        if ':predicates' in line:
            design_file.write('\t\t(design)\n')
            design_file.write('\t\t(dummy-goal)\n')
        elif 'end_predicates' in line:

            design_file.write('\n')
            action = format_action(ACTION_NAME, PARAMETERS, PRECONDITION, EFFECT)
            design_file.write(action + '\n')
            design_file.write('\n)\n')

            break
    
    domain_file.close()
    design_file.close()
    return

def generate_problems(problem_folder, domain_file, results_path, limit):
    i = 0
    problems = os.listdir(problem_folder)
    while i < limit:
        cur_problem = problems[i+250].replace('.pddl', '')
        
        # Path to read the problem from
        cur_problem_path = '%s/%s' % (problem_folder, problems[i+250])
        
        # Path to write to
        cur_path = '%s/%s' % (results_path, 'p' + str(i+250)) 

        if os.path.exists(cur_path):
            shutil.rmtree(cur_path)
        try:
            os.mkdir(cur_path)
        except:
            print('Error creating problem at: ', cur_path)
        
        write_domain(domain_file, cur_path)
        write_design(domain_file, cur_path)
        write_design_problem(cur_problem_path, cur_path)
        hyps = write_template(cur_problem_path, cur_path)
        write_hyps(hyps, cur_path)

        i += 1

    return



if __name__ == '__main__':
    problem_folder = sys.argv[1] # path specifying problem folder
    domain_file = sys.argv[2] # Path specifying domain file
    results_folder_path = sys.argv[3] # path specifying results folder
    num_to_generate = int(sys.argv[4]) # number of files to generate

    generate_problems(problem_folder, domain_file, results_folder_path, num_to_generate)



'''
python3 code/translator.py ./benchmarks/grd-apk-pair/k-planner/rocksample/problems ./benchmarks/grd-apk-pair/k-planner/rocksample/domain.pddl 
./benchmarks/grd-apk-pair-eval/k-planner/rocksample 3
'''