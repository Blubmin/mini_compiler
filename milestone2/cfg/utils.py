from cfg.Global import Global

from functools import reduce

def get_scratch():
    return Global(".read_scratch", "i64")

def cur_block():
    string = ""
    string += "LU{}".format(block_counter)
    return string

def new_block():
    global block_counter
    block_counter += 1
    string = cur_block()
    return string

def new_register():
    global register_counter
    register_counter += 1
    string = ""
    string += "r{}".format(register_counter)

    return string

def get_type(mini_type):
    llvm_type = mini_type
    if mini_type in ["int", "bool"]:
        llvm_type = "i64"
    elif mini_type != "void":
        llvm_type = "%struct.{}*".format(mini_type)
    return llvm_type

def get_struct_index(type, id):
    struct = structs[type]
    for i, f in enumerate(struct):
        if f == id:
            return (i, get_type(struct[f]))

def get_struct_size(type):
    struct = structs[type]
    return len(struct.keys()) * 8

def get_fun_type(id):
    return functions[id]["type"]

def get_fun_arg_type(id, idx):
    return functions[id]["args"][idx]["type"]

def get_global(id):
    return g_decs[id]

def reduce_list_dict(dict, item):
    dict[item["id"]] = item["structure"]
    return dict

def reduce_func_dict(dict, item):
    dict[item["id"]] = item["type"]
    return dict

def init(types, globals, funcs):
    global register_counter
    register_counter = -1

    global block_counter
    block_counter = -1

    global structs
    structs = [{"id": get_type(t), "structure": types[t]} for t in types if t not in ["int", "bool", "void"]]
    structs = reduce(reduce_list_dict, structs, {})

    global g_decs
    g_decs = [{"id": g, "type": Global(g, get_type(globals[g]))} for g in globals]
    g_decs = reduce(reduce_func_dict, g_decs, {})

    global functions
    functions = {}
    for f in funcs:
        args = []
        for a in funcs[f]["_ast"]["parameters"]:
            args += [{"id": a["id"], "type": get_type(a["type"])}]
        functions[f] = {"type": get_type(funcs[f]["_return"]), "args": args}