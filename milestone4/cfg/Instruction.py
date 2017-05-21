from cfg import utils

class StoreInstruction:
    def __init__(self, source, target, type):
        self.target = target
        self.source = source
        self.type = type

        target.set_definition(self)
        source.add_use(self)

    def get_target(self):
        return self.target

    def __str__(self):
        string = ""
        string += "store {} {}, {}* {}".format(self.type, self.source, self.type, self.target)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class LoadInstruction:
    def __init__(self, source, target, type):
        self.target = target
        self.source = source
        self.type = type

        target.set_definition(self)
        source.add_use(self)

    def get_target(self):
        return self.target

    def __str__(self):
        string = ""
        string += "{} = load {}* {}".format(self.target, self.type, self.source)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class AllocaInstruction:
    def __init__(self, target):
        self.target = target

        target.set_definition(self)

    def __str__(self):
        string = ""
        string += "{} = alloca {}".format(self.target, self.target.type)
        return string

    def replace(self, o, r):
        return

class RetInstruction:
    def __init__(self, type, source):
        self.type = type
        self.source = source

        source.add_use(self)

    def __str__(self):
        string = "ret "
        if self.type == "void":
            string += "void"
        else:
            string += "{} {}".format(self.type, self.source)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class JumpInstruction:
    def __init__(self, dest):
        self.dest = dest

    def __str__(self):
        string = ""
        string += "br {}".format(self.dest.get_label())
        return string

    def replace(self, o, r):
       return

class GetElementPtrInstruction:
    def __init__(self, type, source, idx, target):
        self.source = source
        self.type = type
        self.idx = idx
        self.target = target

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = getelementptr inbounds {} {}, i1 0, i32 {}".format(self.target, self.type, self.source, self.idx)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class ICmpInstruction:
    def __init__(self, target, lft, rht, type, cond):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type
        self.cond = cond

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = icmp {} {} {}, {}".format(self.target, self.cond, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class BrInstruction:
    def __init__(self, cond, true, false):
        self.cond = cond
        self.true = true
        self.false = false

        cond.add_use(self)

    def __str__(self):
        string = ""
        string += "br i1 {}, {}, {}".format(self.cond, self.true.get_label(), self.false.get_label())
        return string

    def replace(self, o, r):
        if self.cond is o:
            self.cond = r


class PrintInstruction:
    def __init__(self, value, endl):
        self.value = value
        self.endl = endl

        value.add_use(self)

    def __str__(self):
        string = ""
        string += "call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*"
        string += "@.print{}, i32 0, i32 0), ".format("ln" if self.endl else "")
        string += "i64 {})".format(self.value)
        return string

    def replace(self, o, r):
        if self.value is o:
            self.value = r

class ReadInstruction:
    def __str__(self):
        string = ""
        string += "call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds "
        string += "([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)"
        return string

    def replace(self, o, r):
        return

class AddInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = add {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class SubInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = sub {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class MultInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = mul {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class DivInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = sdiv {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class MallocInstruction:
    def __init__(self, target, size):
        self.target = target
        self.size = size

        target.set_definition(self)

    def __str__(self):
        string = ""
        string += "{} = call i8* @malloc(i64 {})".format(self.target, self.size)
        return string

    def replace(self, o, r):
        return

class FreeInstruction:
    def __init__(self, source):
        self.source = source

        source.add_use(self)

    def __str__(self):
        string = ""
        string += "call void @free(i8* {})".format(self.source)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class BitcastInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = bitcast {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class ZextInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = zext {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class TruncInstruction:
    def __init__(self, target, source, from_type, to_type):
        self.target = target
        self.source = source
        self.from_type = from_type
        self.to_type = to_type

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = trunc {} {} to {}".format(self.target, self.from_type, self.source, self.to_type)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class CallInstruction:
    def __init__(self, target, id, type, args):
        self.target = target
        self.id = id
        self.type = type
        self.args = args

        if (target is not None):
            target.set_definition(self)

        for a in args:
            a.add_use(self)

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

    def replace(self, o, r):
        for i in range(len(self.args)):
            if self.args[i] is o:
                self.args[i] = r

class NotInstruction:
    def __init__(self, target, source, type):
        self.target = target
        self.source = source
        self.type = type

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = xor {} 1, {}".format(self.target, self.type, self.source)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class NegInstruction:
    def __init__(self, target, source, type):
        self.target = target
        self.source = source
        self.type = type

        target.set_definition(self)
        source.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = sub {} 0, {}".format(self.target, self.type, self.source)
        return string

    def replace(self, o, r):
        if self.source is o:
            self.source = r

class AndInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = and {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class OrInstruction:
    def __init__(self, target, lft, rht, type):
        self.target = target
        self.lft = lft
        self.rht = rht
        self.type = type

        target.set_definition(self)
        lft.add_use(self)
        rht.add_use(self)

    def __str__(self):
        string = ""
        string += "{} = or {} {}, {}".format(self.target, self.type, self.lft, self.rht)
        return string

    def replace(self, o, r):
        if self.lft is o:
            self.lft = r
        if self.rht is o:
            self.rht = r

class PhiInstruction:
    def __init__(self, target, type):
        self.target = target
        self.type = type
        self.sources = []

        target.set_definition(self)

    def add_source(self, source):
        self.sources += [source]
        source["value"].add_use(self)

    def __str__(self):
        string = ""
        string += "{} = phi {} ".format(self.target, self.type)
        for s in self.sources:
            string += "[ {}, %{} ], ".format(s["value"], s["location"].label)
        string = string[:-2]
        return string

    def replace(self, o, r):
        for i in range(len(self.sources)):
            if self.sources[i]["value"] is o:
                self.sources[i]["value"] = r
