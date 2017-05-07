class Num:
    def __init__(self, value):
        self.value = value
        self.type = "i64"

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Null:
    def __init__(self):
        self.value = "null"

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Bool:
    def __init__(self, val):
        self.value = 1 if val == "true" else 0
        self.type = "i64"

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string