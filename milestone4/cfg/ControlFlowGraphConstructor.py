from cfg.Function import Function
from cfg import utils

cfg = None

def create_functions(functions):
    for f in functions:
        fun = Function(functions[f]["_ast"])
        cfg[fun.name] = fun


def create_cfg(symbol_table, use_stack):
    utils.init(symbol_table["types"], symbol_table["global"], symbol_table["functions"], use_stack)
    global cfg
    cfg = {}
    create_functions(symbol_table["functions"])
    return cfg
