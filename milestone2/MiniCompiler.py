import argparse
import json
import os
import subprocess
import sys

import ControlFlowGraphConstructor
import LLVMWriter
import StaticSemanticAnalyzer

def cleanup(filename):
    os.remove(filename)

def parse_file(filename):
    code = subprocess.call(["java", "-jar", "given_parser.jar", filename])
    if code != 0:
        print("Failed to parse file: {}".format(args.filename))
        exit(-1)

def parse_args():
    parser = argparse.ArgumentParser(description="Compiles .mini programs")
    parser.add_argument("filename")
    return parser.parse_args(sys.argv[1:])

if __name__ == "__main__":
    code = 0;
    args = parse_args()
    parse_file(args.filename)
    json_file = "{}.json".format(args.filename)

    tree = json.load(open(json_file))

    try:
        symbol_table = StaticSemanticAnalyzer.analyze_tree(tree)
        cfg = ControlFlowGraphConstructor.create_cfg(symbol_table)
        LLVMWriter.write_to_file("{}.ll".format(args.filename.split(".")[0]), symbol_table, cfg);
    except StaticSemanticAnalyzer.SemanticError:
        code = 1
    finally:
        cleanup(json_file)

    exit(code)

