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
        self.locals = {}
        self.params = Parameters(ast_func["parameters"])
        self.entry = Block(self, None)
        self.blocks = [self.entry]

        for d in ast_func["declarations"]:
            local = Local.from_dict(d)
            self.locals[local.id] = local
            self.entry.add_local(local)

            if utils.stack:
                alloca = AllocaInstruction(local)
                self.entry.add_instruction(alloca)

        for p in self.params:
            local = Local.from_param(p)
            self.locals[local.id] = local
            self.entry.add_local(local)

            if utils.stack:
                alloca = AllocaInstruction(local)
                self.entry.add_instruction(alloca)
                store = StoreInstruction(p.reg, local, p.type)
                self.entry.add_instruction(store)

        self.ret = Block(self, None, False)
        self.traverse_tree(ast_func["body"])
        self.ret.seal()

        temp = Register(self.type, self.ret)
        if utils.stack:
            ret_local = Local(".ret", self.type, utils.get_default(self.type))

            if self.type != "void":
                load = LoadInstruction(ret_local, temp, self.type)
                self.ret.add_instruction(load)

        elif self.type != "void":
                ret_local = self.ret.get_id(".ret")
                temp = ret_local.value

        ret = RetInstruction(self.type, temp)
        self.ret.add_instruction(ret)

        self.clean_phis()

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

    def clean_phis(self):
        for b in self.blocks:
            to_remove = []
            for i in range(len(b.instructions)):
                if type(b.instructions[i]) is PhiInstruction:
                    target = b.instructions[i].target
                    remaining = list(filter(lambda x: x["value"] != target, b.instructions[i].sources))
                    temp = []
                    for r in remaining:
                        if r["value"] not in temp:
                            temp += [r["value"]]
                    if len(remaining) == 1 or len(temp) == 1:
                        self.replace(target, remaining[0]["value"])
                        to_remove += [b.instructions[i]]
            for r in to_remove:
                b.instructions.remove(r)

    def replace(self, original, replacement):
        for b in self.blocks:
            for i in b.instructions:
                i.replace(original, replacement)
        for i in self.ret.instructions:
            i.replace(original, replacement)

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