import os
import utils
import defs

def solve(solver_path,domain_file_name, problem_file_name, index):


    cmd = '%s/poprp %s %s --dump-policy 3' % (solver_path, domain_file_name, problem_file_name)
    utils.run(cmd, solver_path)

    # policy_file = os.path.join(os.getcwd(),'policy_hyp_%d'%hyp_index)
    # cmd = 'python %s/translate_policy.py > %s'%(self.solver_path,policy_file)
    # utils.run(cmd, self.solver_path)

    # copy the generated policy file
    generated_file = os.path.join(solver_path, 'plan.dot')
    gen_folder = defs_apk.get_gen_folder_name()
    policy_file = os.path.join(gen_folder, 'policy_hyp_%d' % index)
    cmd = 'mv %s %s' % (generated_file, policy_file)
    utils.run(cmd)

    # copy the generated compiled files
    file_path = os.path.join(solver_path, 'compiled-domain.pddl')
    new_domain_file = os.path.join(gen_folder, 'compiled-domain_%d.pddl' % index)
    cmd = 'mv %s %s' % (file_path, new_domain_file)
    utils.run(cmd)

    # copy the generated compiled files
    file_path = os.path.join(solver_path, 'compiled-problem.pddl')
    new_probem_file = os.path.join(gen_folder, 'compiled-problem_%d.pddl' % index)
    cmd = 'mv %s %s' % (file_path, new_probem_file)
    utils.run(cmd)

    return policy_file