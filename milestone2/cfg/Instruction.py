from cfg import utils

class StoreInstruction:
    def __init__(self, source, target, type):
        self.target = target
        self.source = source
        self.type = type

    def get_target(self):
        return self.target

    def __str__(self):
        string = ""
        string += "store {} {}, {}* {}".format(self.type, self.source, self.type, self.target)
        return string

class LoadInstruction:
    def __init__(self, source, target, type):
        self.target = target
        self.source = source
        self.type = type

    def get_target(self):
        return self.target

    def __str__(self):
        string = ""
        string += "{} = load {}* {}".format(self.target, self.type, self.source)
        return string

class AllocaInstruction:
    def __init__(self, target):
        self.target = target

    def __str__(self):
        string = ""
        string += "{} = alloca {}".format(self.target, self.target.type)
        return string

class RetInstruction:
    def __init__(self, type, value):
        self.type = type
        self.value = value

    def __str__(self):
        string = "ret "
        if self.type == "void":
            string += "void"
        else:
            string += "{} {}".format(self.type, self.value)
        return string

class JumpInstruction:
    def __init__(self, dest):
        self.dest = dest

    def __str__(self):
        string = ""
        string += "br {}".format(self.dest.get_label())
        return string

class GetElementPtrInstruction:
    def __init__(self, type, source, idx, target):
        self.source = source
        self.type = type
        self.idx = idx
        self.target = target

    def __str__(self):
        string = ""
        string += "{} = getelementptr inbounds {} {}, i1 0, i32 {}".format(self.target, self.type, self.source, self.idx)
        return string

class ICmpInstruction:
    def __init__(self, target, lft, rht, type, cond):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type
        self.cond = cond

    def __str__(self):
        string = ""
        string += "{} = icmp {} {} {}, {}".format(self.target, self.cond, self.type, self.lft, self.rht)
        return string

class BrInstruction:
    def __init__(self, cond, true, false):
        self.cond = cond
        self.true = true
        self.false = false

    def __str__(self):
        string = ""
        string += "br i1 {}, {}, {}".format(self.cond, self.true.get_label(), self.false.get_label())
        return string

class PrintInstruction:
    def __init__(self, value, endl):
        self.value = value
        self.endl = endl

    def __str__(self):
        string = ""
        string += "call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*"
        string += "@.print{}, i32 0, i32 0), ".format("ln" if self.endl else "")
        string += "i64 {})".format(self.value)
        return string

class ReadInstruction:
    def __str__(self):
        string = ""
        string += "call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds "
        string += "([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)"
        return string

class AddInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = add {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

class SubInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = sub {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

class MultInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = mul {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

class DivInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = sdiv {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

class MallocInstruction:
    def __init__(self, target, size):
        self.target = target
        self.size = size

    def __str__(self):
        string = ""
        string += "{} = call i8* @malloc(i64 {})".format(self.target, self.size)
        return string

class FreeInstruction:
    def __init__(self, source):
        self.source = source

    def __str__(self):
        string = ""
        string += "call void @free(i8* {})".format(self.source)
        return string

class BitcastInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

    def __str__(self):
        string = ""
        string += "{} = bitcast {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

class ZextInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

    def __str__(self):
        string = ""
        string += "{} = zext {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

class TruncInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

    def __str__(self):
        string = ""
        string += "{} = trunc {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

class CallInstruction:
    def __init__(self, target, id, type, args):
        self.target = target
        self.id = id
        self.type = type
        self.args = args

    def __str__(self):
        string = ""
        if self.target is not None:
            string += "{} = ".format(self.target)
        string += "call {} @{}(".format(self.type, self.id)
        arg_string = ""
        for i, a in enumerate(self.args):
            arg_string += "{} {}, ".format(utils.get_fun_arg_type(self.id, i), a)
        string += arg_string[:-2]
        string += ")"
        return string

class NotInstruction:
    def __init__(self, target, source, type):
        self.target = target
        self.source = source
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = xor {} 1, {}".format(self.target, self.type, self.source)
        return string

class NegInstruction:
    def __init__(self, target, source, type):
        self.target = target
        self.source = source
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = sub {} 0, {}".format(self.target, self.type, self.source)
        return string

class AndInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = and {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

class OrInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

    def __str__(self):
        string = ""
        string += "{} = or {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string