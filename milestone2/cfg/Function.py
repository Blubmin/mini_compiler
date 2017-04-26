from cfg import utils

from cfg.Block import Block
from cfg.Instruction import *
from cfg.Local import Local
from cfg.Register import Register


class Function:
    def __init__(self, ast_func):
        if ast_func["return_type"] != "void":
            ast_func["declarations"] += [{"id": ".ret", "type": ast_func["return_type"]}]
        self.name = ast_func["id"]
        self.type = utils.get_type(ast_func["return_type"])
        self.params = Parameters(ast_func["parameters"])
        self.entry = Block(self, None)
        self.blocks = [self.entry]

        for d in ast_func["declarations"]:
            local = Local.from_dict(d)
            self.entry.add_local(local)

            alloca = AllocaInstruction(local)
            self.entry.add_instruction(alloca)

        for p in self.params:
            local = Local.from_param(p)
            self.entry.add_local(local)

            alloca = AllocaInstruction(local)
            self.entry.add_instruction(alloca)

            store = StoreInstruction(p.reg, local, p.type)
            self.entry.add_instruction(store)

        self.ret = Block(self, None)
        ret_local = Local(".ret", self.type)
        temp = Register(self.type, self.ret)

        if self.type != "void":
            load = LoadInstruction(ret_local, temp, self.type)
            self.ret.add_instruction(load)

        ret = RetInstruction(self.type, temp)
        self.ret.add_instruction(ret)

        self.traverse_tree(ast_func["body"])

    def traverse_tree(self, tree):
        block = self.entry
        ret = False
        for s in tree:
            block = block.traverse_statement(s)
            if block is None:
                ret = True
                break
        if self.type == "void" and not ret:
            inst = JumpInstruction(self.ret)
            self.blocks[-1].add_instruction(inst)

    def __str__(self):
        string = ""
        string += "define {} @{} ".format(self.type, self.name)
        string += "{}".format(self.params)
        string += " {\n"
        block_string = ""
        for b in self.blocks:
            block_string += "{}".format(b)
        string += block_string
        string += "{}".format(self.ret)
        string += "}\n"
        return string

class Parameters:
    def __init__(self, ast_params):
        self.params = []
        for p in ast_params:
            self.params += [Parameter(p)]

    def __getitem__(self, item):
        return self.params[item]

    def __iter__(self):
        return self.params.__iter__()

    def __str__(self):
        string = ""
        string += "("
        param_string = ""
        for p in self.params:
            param_string += "{}, ".format(p)
        string += param_string[:-2]
        string += ")"
        return string

class Parameter:
    def __init__(self, ast_param):
        self.type = utils.get_type(ast_param["type"])
        self.reg = Register(self.type, utils.cur_block())
        self.id = ast_param["id"]

    def __str__(self):
        string = ""
        string += "{} {}".format(self.type, self.reg)
        return string