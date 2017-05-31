from arm.Block import Block

class Function:
    def __init__(self, fun):

        self.name = fun.name

        self.blocks = []
        for b in fun.blocks:
            self.blocks += [Block(b)]
        self.blocks+= [Block(fun.ret)]

    def __str__(self):
        string = ""
        string += "\t.text\n" if self.name == "main" else ""
        string += "\t.align 2\n"
        string += "\t.global {}\n".format(self.name)
        string += "\t.syntax unified\n"
        string += "\t.arm\n"
        string += "\t.fpu vfpv3 - d16\n"
        string += "\t.type {}, %function\n"
        string += "{}:\n".format(self.name)
        for b in self.blocks:
            string += "{}".format(b)
        string += "\t.size {}, .-{}".format(self.name, self.name)
        return string