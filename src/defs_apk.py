import os
import errno
import shutil

SEPARATOR = ' '
REC_KNOW_STRING  = ';;; Recognition system knowledge'
AGENT_KNOW_STRING = ';;; Agent knowledge'
HYPS_STRING = ';;; HYPS <hyp>'
ADDED_PREDICATES_STRING = ';;; CHANGES'
FAILURE_STRING = 'FAIL'
NA = 'NA'
ITER_LIMIT = 500
DEFAULT_TIME_LIMIT = 1800
MODIFICATIONS_COUNTER = 0
DEFAULT_MAX_HORIZON = 1000
NON_OBS_STATE_STRING = 'NA'
INFINITE = 88888
TIMEOUT = 3333333
ERROR_WCD = INFINITE
ERROR_COST = INFINITE
TEMPLATE_FILE = 'TEMPLATE_FILE'
HYPS_FILE = 'HYPS_FILE'
DOMAIN_FILE = 'DOMAIN_FILE'
NA = 'NA'
BFD = 'bfd'
DESIGN_LOG_NAME = "design_log.txt"
DESIGN_RESULTS_LOG_NAME = "design_log_results.txt"
DESIGN_ANALYTICS_LOG_NAME = "design_log_analytics.txt"
DOMAIN_ID = ''
PLANNER_TYPE = ''
UTILITY_TYPE = ''
SEPARATOR_STRING = '---'
KAC_COMPILATION = 'kac'
MULTIPLE_GOALS = False

GET_FO_COST = False
FO_PLANNER = 'fd:lmcut'

def set_domain_ID(domain_id):
    global DOMAIN_ID
    DOMAIN_ID = domain_id

def set_planner_type(planner_type):
    global PLANNER_TYPE
    PLANNER_TYPE = planner_type

def set_utility(utility_type):
    global UTILITY_TYPE
    UTILITY_TYPE = utility_type

def set_compilation(compilation_type):
    global COMPILATION_TYPE
    COMPILATION_TYPE = compilation_type


def get_gen_folder_name():
    if 'src' in os.getcwd() or 'script' in os.getcwd():
        gen_folder = os.path.join(os.path.abspath('../logs/logs--%s--%s--%s--%s'%(DOMAIN_ID,UTILITY_TYPE,COMPILATION_TYPE,PLANNER_TYPE.replace(':',''))),'gen')
    else:
        gen_folder = os.path.join(os.path.abspath('./logs/logs--%s--%s--%s--%s'%(DOMAIN_ID,UTILITY_TYPE,COMPILATION_TYPE,PLANNER_TYPE.replace(':',''))), 'gen')
    return gen_folder


def get_log_folder_name():
    if 'src' in os.getcwd() or 'script' in os.getcwd():
        log_folder = os.path.join(os.path.abspath('../logs/logs--%s--%s--%s--%s'%(DOMAIN_ID,UTILITY_TYPE,COMPILATION_TYPE,PLANNER_TYPE.replace(':',''))), 'log')
    else:
        log_folder = os.path.join(os.path.abspath('./logs/logs--%s--%s--%s--%s'%(DOMAIN_ID,UTILITY_TYPE,COMPILATION_TYPE,PLANNER_TYPE.replace(':',''))), 'log')

    return log_folder


def clear_logs_folder():

    if 'src' in os.getcwd() or 'script' in os.getcwd():
        if os.path.exists('../logs'):
            shutil.rmtree('../logs')
    else:
        if os.path.exists('./logs'):
            shutil.rmtree('./logs')


def create_log_files():

    # gen folder
    if not os.path.exists(get_gen_folder_name()):
        try:
            os.makedirs(get_gen_folder_name())
        except OSError as exc:  # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    # log folder
    log_file_name = os.path.join(get_log_folder_name(), DESIGN_LOG_NAME)
    if not os.path.exists(os.path.dirname(log_file_name)):
        try:
            os.makedirs(os.path.dirname(log_file_name))
        except OSError as exc:  # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise
    log_file = open(log_file_name, "a")

    log_file_results_name = os.path.join(get_log_folder_name(), DESIGN_RESULTS_LOG_NAME)
    if not os.path.exists(os.path.dirname(log_file_results_name)):
        try:
            os.makedirs(os.path.dirname(log_file_results_name))
        except OSError as exc:  # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise
    log_file_results = open(log_file_results_name, "a")

    log_file_analytics_name = os.path.join(get_log_folder_name(), DESIGN_ANALYTICS_LOG_NAME)
    if not os.path.exists(os.path.dirname(log_file_analytics_name)):
        try:
            os.makedirs(os.path.dirname(log_file_analytics_name))
        except OSError as exc:  # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise
    log_file_analytics = open(log_file_analytics_name, "a")

    return [log_file, log_file_results, log_file_analytics]



INFORMATION_SHAPING_STRING = "infoshaping"

def get_modification_counter():
    MODIFICATIONS_COUNTER== MODIFICATIONS_COUNTER + 1
    return MODIFICATIONS_COUNTER



# Frontier Options
FIFO = 'FIFO'

SOLVER_PRP = 'PRP'
SOLVER_REPLANNER = 'replanner'

def get_solver_type(solver_path):

    if 'prp' in solver_path.lower():
        return SOLVER_PRP
    elif 'replanner' in solver_path.lower():
        return SOLVER_REPLANNER


FF = 'ff'
if 'src' in os.getcwd():
    FF_PATH = os.path.abspath(os.path.join('../solvers/FF-v2.3'))
else: #run by script from the main folder
    FF_PATH = os.path.abspath(os.path.join('./solvers/FF-v2.3'))


FD = 'fd'
if 'src' in os.getcwd():
    FD_PATH =  os.path.abspath('../solvers/Fast-Downward')
else: #run by script from the main folder
    FD_PATH = os.path.abspath('./solvers/Fast-Downward')


def get_planner_path(planner_type):
    if FD in planner_type.lower():
        return FD_PATH
    if FF in planner_type.lower():
        return FF_PATH
    else:
        print('planner_type %s not supported'%planner_type)
        raise NotImplementedError


