cfg = None
label_counter = 0
register_counter = 0

def create_label_name() :
    global label_counter
    label = "LU{}".format(label_counter)
    label_counter += 1
    return label

def create_register_name() :
    global register_counter
    register = "%r{}".format(register_counter)
    register_counter += 1
    return register

def create_new_block() :
    block = {"label": create_label_name()}
    block["instructions"] = []
    block["next"] = None
    return block

def get_type(typ):
    if typ in ["int", "bool"]:
        typ = "i64"
    elif typ != "void":
        typ = "%struct.{}".format(typ)
    return typ

def create_local(func, block, function, id):
    target = "%{}".format(id)
    instruction = {}
    instruction["opcode"] = "alloca"
    instruction["type"] = get_type(function[id])
    instruction["target"] = target
    block["instructions"] += [instruction]
    func["locals"][id] = {}
    func["locals"][id][block["label"]] = target

def create_store(block, typ, t, s):
    instruction = {}
    instruction["opcode"] = "store"
    instruction["source"] = s
    instruction["source_type"] = typ
    instruction["target"] = t
    instruction["target_type"] = "{}*".format(typ)
    block["instructions"] += [instruction]

def create_declarations(func, function):
    for id in (id for id in function if "_" not in id):
        create_local(func, func["cfg"][0], function, id)
    for i in range(len(func["params"])):
        create_store(func["cfg"][0], func["params"][i]["type"], function["_params"][i],func["params"][i]["location"])

def create_parameter(func, function, param):
    typ = get_type(function[param])
    reg = create_register_name()
    func["params"] += [{"type":typ, "location":reg}]
    func["locals"][param] = {"type":typ, "location":reg}


def create_parameters(func, function):
    func["params"] = []
    func["locals"] = {}
    for p in function["_params"]:
        create_parameter(func, function, p)


def create_function(function):
    func = {}
    func["name"] = "%function.{}".format(function["_name"])
    typ = get_type(function["_return"])
    func["type"] = typ
    func["cfg"] = [create_new_block()]
    create_parameters(func, function)
    create_declarations(func, function)
    cfg[func["name"]] = func


def create_functions(functions):
    for f in functions:
        create_function(functions[f])


def create_cfg(symbol_table):
    global cfg
    cfg = {}
    create_functions(symbol_table["functions"])
    return cfg
