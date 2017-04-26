from cfg import utils

class Register:
    def __init__(self, type, where):
        self.id = utils.new_register()
        self.type = type
        self.where = where
        self.instructions = []

    def __str__(self):
        string = ""
        string += "%{}".format(self.id)
        return string