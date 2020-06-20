import sys, os
import shutil
import random
import gr_poa_kp, defs

'''
From a few template folders, create different problems by editing
hyps (from a file of potential hyps) and reducing hidden elements
'''
def format_paths(problem_path):
    # edit args to allow wcd to be calculated
    solver_path = sys.argv[1]# e.g. '/mnt/c/Users/sarah/OneDrive/Documents/UtilityMaximizingDesign/solvers/PRP/planner-for-relevant-policies/src'
    
    sys.argv[2] = '%s/domain.pddl' % problem_path # domain file path
    sys.argv[3] = '%s/template.pddl' % problem_path # template file path
    sys.argv[4] = '%s/hyps.dat' % problem_path # hyps file path

    return

POSSIBLE_HYPS = ['(ball-at-spot b1)', '(ball-at-spot b2)', '(ball-at-spot b3)', '(ball-at-spot b4)', '(ball-at-spot b5)', '(ball-at-spot b6)']
# POSSIBLE_HYPS = ['(done r1)', '(done r2)', '(done r3)', '(done r4)', '(done r5)']
# ### Rocksample ###
def select_hyps(used_pairs):
    i, j = random.randint(2, 4), random.randint(2,4)
    hyp_1, hyp_2 = random.sample(POSSIBLE_HYPS, i), random.sample(POSSIBLE_HYPS, j)
    hyp_1, hyp_2 = " ".join(hyp_1), " ".join(hyp_2)
    
    if [hyp_1, hyp_2] in used_pairs:
        hyp_1, hyp_2 = random.sample(POSSIBLE_HYPS, i), random.sample(POSSIBLE_HYPS, j)
        hyp_1, hyp_2 = " ".join(hyp_1), " ".join(hyp_2)

    used_pairs.append([hyp_1, hyp_2])
    return [hyp_1, hyp_2]


### Trail ###
# POSSIBLE_HYPS = ['(final-stone p7)', '(final-stone p8)', '(final-stone p10)', '(final-stone p13)', '(final-stone p14)', '(final-stone p15)', '(final-stone p16)', '(final-stone p19)', '(final-stone p20)', '(final-stone p22)', '(final-stone p28)', '(final-stone p31)', '(final-stone p32)', '(final-stone p34)', '(final-stone p35)', '(final-stone p37)', '(final-stone p38)', '(final-stone p40)', '(final-stone p43)', '(final-stone p44)', '(final-stone p46)', '(final-stone p49)', '(final-stone p50)', '(final-stone p52)', '(final-stone p55)', '(final-stone p56)', '(final-stone p57)', '(final-stone p58)']
# def select_hyps(used_pairs):
#     # edit to change how hyps are selected 
#     pair = random.sample(POSSIBLE_HYPS, 2)
#     while pair in used_pairs:
#         pair = random.sample(POSSIBLE_HYPS, 2)
    
#     used_pairs.append(pair)
#     return pair


def write_hyps(problem_path, used_pairs):
    hyps_file = open('%s/hyps.dat' % problem_path, 'w')

    hyps = select_hyps(used_pairs)
    for index, hyp in enumerate(hyps):
        if index == len(hyps)-1:
            hyps_file.write(hyp)
        else:
            hyps_file.write('%s\n' % hyp)

def has_zero_wcd(problem_path):
    if os.path.exists(defs.get_gen_folder_name()):
        shutil.rmtree(defs.get_gen_folder_name())
    os.makedirs(defs.get_gen_folder_name())

    solver_path = sys.argv[1]
    domain_file_name = '%s/domain.pddl' % problem_path # domain file path
    template_file_name = '%s/template.pddl' % problem_path # template file path
    hyps_file_name = '%s/hyps.dat' % problem_path # hyps file path

    gr_poa_problem = gr_poa_kp.GR_POA_KP(solver_path, domain_file_name, template_file_name, hyps_file_name)
    [wcd, _, _] = gr_poa_problem.get_wcd()

    a = random.randint(0,3)
    if a == 1:
        return False
    else:
        return wcd == 0



def copy_files(template_path, results_path):
    for filename in os.listdir(template_path):
        if filename.endswith(".pddl"):
            file_to_copy = os.path.join(template_path, filename)
            shutil.copy2(file_to_copy, results_path)

    # copy relevant files to new problem


def generate_problems(results_path, problem_folder_path, limit):

    problems = os.listdir(problem_folder_path)
    print(problems)
    for problem_name in problems:
        template_path = '%s%s' % (problem_folder_path, problem_name)
        used_pairs = []
        for i in range(limit):

            current_path = '%s-%s' % (results_path + problem_name, str(i))

            try:
                os.mkdir(current_path)
            except:
                pass

            format_paths(current_path)
            copy_files(template_path, current_path)
            write_hyps(current_path, used_pairs)
            while has_zero_wcd(current_path):
                write_hyps(current_path, used_pairs)

            print(used_pairs)

if __name__ == '__main__':

    solver_path = sys.argv[1] # path to solver ( to calculate wcd ) 
    template_problem = sys.argv[2] # path specifying problem to edit
    results_path = sys.argv[3] # path specifying results folder
    num_to_generate = int(sys.argv[4]) # number of files to generate

    generate_problems(results_path, template_problem, num_to_generate)
    # print(sys.argv[1])
    # sys.argv[1] = "hello'"
    # print(wcd)s