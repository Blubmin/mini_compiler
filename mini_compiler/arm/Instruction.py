from arm.Register import Register
from arm.Literals import *

def arm_instruction(inst):
    options = {
        "AddInstruction": BinInstruction("add"),
        "PrintInstruction": PrintInstruction(),
        "RetInstruction": RetInstruction(),
        "ReadInstruction": ReadInstruction(),
        "LoadInstruction": LoadInstruction()
    }
    return options[inst.__class__.__name__].construct(inst)

def convert_type(val):
    options = {
        "Register": Register,
        "Null": Null,
        "Num": Num,
        "Bool": Bool
    }
    return options[val.__class__.__name__](val)

class BinInstruction:
    def __init__(self, arg):
        self.arg = arg

    def construct(self, inst):
        self.target = convert_type(inst.target)
        self.lft = convert_type(inst.lft)
        self.rht = convert_type(inst.rht)
        return self

    def __str__(self):
        string = ""
        string += "{} {}, {}, {}".format(self.arg, self.target, self.lft, self.rht)
        return string

class PrintInstruction:

    def construct(self, inst):
        format = ".PRINT{}".format("L" if inst.endl else "")
        self.movw = MovwInstruction("r0", format)
        self.movt = MovtInstruction("r0", format)
        self.mov = MovInstruction("r1", convert_type(inst.value))
        self.call = CallInstruction("printf")
        return self

    def __str__(self):
        string = ""
        string += "{}\n".format(self.movw)
        string += "\t{}\n".format(self.movt)
        string += "\t{}\n".format(self.mov)
        string += "\t{}".format(self.call)
        return string

class RetInstruction:

    def construct(self, inst):
        self.mov = MovInstruction("r0", convert_type(inst.source))
        return self

    def __str__(self):
        return "{}".format(self.mov)

class ReadInstruction:

    def construct(self, inst):
        self.movw = MovwInstruction("r0", ".SCAN")
        self.movt = MovtInstruction("r0", ".SCAN")
        self.call = CallInstruction("__isoc99_scanf")
        return self

    def __str__(self):
        string = ""
        string += "{}\n".format(self.movw)
        string += "\t{}\n".format(self.movt)
        string += "\t{}".format(self.call)
        return string

class LoadInstruction:

    def construct(self, inst):
        print(inst)
        return self

    def __str__(self):
        return ""

class MovInstruction:
    def __init__(self, dest, value):
        self.dest = dest
        self.value = value

    def __str__(self):
        string = ""
        string += "mov {}, {}".format(self.dest, self.value)
        return string

class MovwInstruction:
    def __init__(self, dest, value):
        self.dest = dest
        self.value = value

    def __str__(self):
        string = ""
        string += "movw {}, #:lower16:{}".format(self.dest, self.value)
        return string

class MovtInstruction:
    def __init__(self, dest, value):
        self.dest = dest
        self.value = value

    def __str__(self):
        string = ""
        string += "movt {}, #:upper16:{}".format(self.dest, self.value)
        return string

class CallInstruction:
    def __init__(self, call):
        self.call = call

    def __str__(self):
        string = ""
        string += "bl {}".format(self.call)
        return string