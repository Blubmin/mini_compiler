class Num:
    def __init__(self, n):
        self.value = n.value

    def __str__(self):
        return "#{}".format(self.value)

class Null:
    def __init__(self, null):
        self.value = 0

    def __str__(self):
        return "#{}".format(self.value)

class Bool:
    def __init__(self, b):
        self.value = b.value

    def __str__(self):
        return "#{}".format(self.value)