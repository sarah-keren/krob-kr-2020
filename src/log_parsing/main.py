import argparse, os, fnmatch
from collections import defaultdict
import parse_results
from parse_analytics import ParseAnalytics

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Parser to parse different log files')
    parser.add_argument('--type', help='parsing type (results, analytics)')    
    parser.add_argument('--path', help='path to log folder')
    parser.add_argument('--dest', help='path to file to write results to (optional) currently only analytics')
    parser.add_argument('--print', help='print to terminal')
    parser.add_argument('--compile', help='compile results from multiple files in folder (e.g. ./logs)')
    parser.add_argument('--parse', help='parse to terminal')
    parser.add_argument('--last_problem', help='stopping point for parsing (optional)', default="none")

    args = parser.parse_args()

    if not args.path:
        print("usage: --path= ./path/to/logs")
    if not args.type:
        print("usage: --type=results | --type=analytics")
    
    if args.compile: #create single file with results
        outfile_name = 'compiled_logs_%s.txt' % args.type
        with open(outfile_name, "wb") as outfile:
            for folder in os.listdir(args.path):
                print(folder)
                if os.path.isdir(args.path+'/'+folder):
                    for log_ in os.listdir(args.path + '/' + folder +'/log/'):
                        if fnmatch.fnmatch(log_, '*_%s.txt' % args.type):
                            with open(args.path+'/'+folder+'/log/'+log_, "rb") as infile:
                                line = infile.readline()
                                while line:
                                    if args.last_problem in line.decode():
                                        break
                                    outfile.write(line)
                                    line = infile.readline()

                                # outfile.write(infile.read())

        args.path = './%s' % outfile_name

    results = None
    if args.type == 'results':
        parse_results.main(args)

    if args.type == 'analytics':
        c = ParseAnalytics(args.path)
        try:
            results = c.process_logs()
        except IndexError:
            print("Logs format error: the last problem may not have completed.")
        

        if results and args.dest:
            c.write_to_dest(args.dest)

        if args.print:
            c.print_results()

        if args.parse:
            c.parse_results()


