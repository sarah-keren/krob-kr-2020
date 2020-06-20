import os

def parse_values():
    results_file_path = "/home/sarah/Desktop/results.txt"
    results_file = open(results_file_path, "r")
    lines = results_file.readlines()
    index = 0
    total = 0
    for line in lines:
        cur_line = line.split()
        cur_line = cur_line[0].replace('cur_value::','')
        total += int(cur_line)
        index += 1

    average = total/index
    print(average)


def parse_replans():
    results_file_path = "/home/sarah/Desktop/logs-ijcai-robustness/logs-robust-color-balls-4/logs--dataset-JAIR---colored-balls-pos-min---Set-robust--er-umd--kprudent-high--fdhmaxcachetrans/log/design_log_analytics.txt"
    results_file = open(results_file_path, "r")
    lines = results_file.readlines()
    index = 0
    total = 0
    for line in lines:
        if 'number_of_planner_calls:' in line:
            cur_line = line.split('number_of_planner_calls:')
            cur_line = cur_line[1].split(',')[0]
            total += int(cur_line)
            index += 1

    average = total / index
    print(average)


if __name__ == '__main__':
    parse_replans()
