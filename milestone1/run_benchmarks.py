import os
import subprocess
import time

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def print_color(msg, color):
    print("{}{}{}".format(color, msg, bcolors.ENDC))

def print_bold_color(msg, color):
    print("{}{}{}{}".format(bcolors.BOLD, color, msg, bcolors.ENDC))

if __name__ == "__main__":
    print_bold_color("Benchmarks Milestone1", bcolors.HEADER)
    for (path, dirs, files) in os.walk("../benchmarks"):
        for dir in dirs:
            benchmark = dir;
            print()
            print_color("====== {} ======".format(dir), bcolors.OKBLUE)
            start = time.time()
            subprocess.call(["python", "MiniCompiler.py", "{}/{}/{}.mini".format(path, dir, dir)])
            print("compile time: {:.5f}".format(time.time() - start))