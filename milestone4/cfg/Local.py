from cfg import utils

class Local:
    def __init__(self, id, type, value):
        self.id = id
        self.type = type
        self.value = value

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    @classmethod
    def from_param(cls, param):
        return cls(param.id, param.type, param.reg)

    @classmethod
    def from_dict(cls, d):
        llvm_type = utils.get_type(d["type"])
        return cls(d["id"], llvm_type, utils.get_default(llvm_type))

    def __str__(self):
        string = ""
        string += "%{}".format(self.id)
        return string