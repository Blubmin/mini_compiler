class Num:
    def __init__(self, value):
        self.value = value
        self.type = "i64"

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Null:
    def __init__(self):
        self.value = "null"

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Bool:
    def __init__(self, val):
        self.value = 1 if val == "true" else 0
        self.type = "i64"

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string