from cfg import utils

class Register:
    def __init__(self, type, where):
        self.id = utils.new_register()
        self.type = type
        self.where = where
        self.definition = []
        self.uses = []

    def set_definition(self, definition):
        self.definition = definition

    def add_use(self, use):
        self.uses += [use]

    def __str__(self):
        string = ""
        string += "%{}".format(self.id)
        return string