import os
import subprocess
import sys
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
    print_bold_color("Benchmarks Milestone3", bcolors.HEADER)
    for (path, dirs, files) in os.walk("../benchmarks"):
        for dir in dirs:
            benchmark = dir;
            print()
            print_color("====== {} ======".format(dir), bcolors.OKBLUE)
            subprocess.call([sys.executable, "MiniCompiler.py", "-s", "{}/{}/{}.mini".format(path, dir, dir)])
            subprocess.call(["clang", "{}/{}/{}.ll".format(path, dir, dir), "-o", "{}/{}/{}".format(path, dir, dir)])
            with open("{}/{}/input".format(path, dir)) as filein:
                with open("{}/{}/test".format(path, dir), "w") as fileout:
                    print_color("Running:", bcolors.OKGREEN)
                    print_color("{} Stack".format(dir), bcolors.OKGREEN)
                    start = time.time()
                    subprocess.call(["{}/{}/{}".format(path, dir, dir)], stdin=filein, stdout=fileout)
            print("run time: {:.5f}".format(time.time() - start))
            subprocess.call(["diff", "{}/{}/output".format(path, dir), "{}/{}/test".format(path, dir)])

            subprocess.call([sys.executable, "MiniCompiler.py", "{}/{}/{}.mini".format(path, dir, dir)])
            subprocess.call(["clang", "{}/{}/{}.ll".format(path, dir, dir), "-o", "{}/{}/{}".format(path, dir, dir)])
            with open("{}/{}/input".format(path, dir)) as filein:
                with open("{}/{}/test".format(path, dir), "w") as fileout:
                    print_color("Running:", bcolors.OKGREEN)
                    print_color("{} SSA".format(dir), bcolors.OKGREEN)
                    start = time.time()
                    subprocess.call(["{}/{}/{}".format(path, dir, dir)], stdin=filein, stdout=fileout)
            print("run time: {:.5f}".format(time.time() - start))
            subprocess.call(["diff", "{}/{}/output".format(path, dir), "{}/{}/test".format(path, dir)])