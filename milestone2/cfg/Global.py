class Global:
    def __init__(self, id, type):
        self.id = id
        self.type = type

    def __str__(self):
        string = ""
        string += "@{}".format(self.id)
        return string