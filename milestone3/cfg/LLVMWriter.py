from cfg import utils

llvm_file = None

def write_alloca(alloca):
    line = "\t{} = alloca {}\n".format(alloca["target"], alloca["type"])
    llvm_file.write(line)

def write_store(store):
    line = "\tstore {} {}, {} {}\n".format(store["source_type"], store["source"], store["target_type"], store["target"])
    llvm_file.write(line)

def write_instruction(instruction):
    options = {
        "alloca": write_alloca,
        "store" : write_store
    }
    options[instruction["opcode"]](instruction)

def write_blocks(block):
    llvm_file.write("{}:\n".format(block["label"]))
    for instruction in block["instructions"]:
        write_instruction(instruction)
    if block["next"] is None:
        return
    for b in block["next"]:
        write_blocks(b)

def write_parameters(params):
    line = ""
    for p in params:
        line += "{} {}, ".format(p["type"], p["location"])
    llvm_file.write(line[:-2])

def write_function(function):
    llvm_file.write("define {} {}(".format(function["type"], function["name"]))
    write_parameters(function["params"])
    llvm_file.write(") {\n")
    write_blocks(function["cfg"][0])
    llvm_file.write("}\n\n")


def write_functions(cfg):
    for f in cfg:
        llvm_file.write(str(cfg[f]))
        llvm_file.write("\n")


def write_globals(st):
    for g in st["global"]:
        default = "0" if utils.get_type(st["global"][g])[0] == "i" else "null"
        line  = "@{} = common global {} {}, align 8\n".format(g, utils.get_type(st["global"][g]), default)
        llvm_file.write(line)
    llvm_file.write("\n")


def write_type_declarations(st):
    for type in st["types"]:
        if type in ["int", "bool", "void", "null"]:
            continue
        line = "%struct.{}".format(type)
        line += " = type {"
        for field in st["types"][type]:
            field_type = st["types"][type][field]
            line += "{}, ".format(utils.get_type(field_type))

        line = line[:-2]
        line += "}\n"
        llvm_file.write(line)
    llvm_file.write("\n")


def write_boilerplate():
    with open("boilerplate.txt", "r") as file:
        for line in file:
            llvm_file.write(line)


def write_to_file(filename, st, cfg):
    global llvm_file
    with open(filename, "w") as file:
        llvm_file = file
        write_boilerplate()
        write_type_declarations(st)
        write_globals(st)
        write_functions(cfg)

