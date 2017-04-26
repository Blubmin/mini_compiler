from cfg import utils

class Local:
    def __init__(self, id, type):
        self.id = id
        self.type = type

    @classmethod
    def from_param(cls, param):
        return cls(param.id, param.type)

    @classmethod
    def from_dict(cls, d):
        return cls(d["id"], utils.get_type(d["type"]))

    def __str__(self):
        string = ""
        string += "%{}".format(self.id)
        return string