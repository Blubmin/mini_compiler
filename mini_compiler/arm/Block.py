from arm.Instruction import arm_instruction
from arm.Register import Register

class Block:
    def __init__(self, blk):

        self.label = blk.label

        self.instructions = []
        for i in blk.instructions:
            self.instructions += [arm_instruction(i)]

    def __str__(self):
        string = ""
        string += ".{}:\n".format(self.label)
        for i in self.instructions:
            string += "\t{}\n".format(i)
        return string