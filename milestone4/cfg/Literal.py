class Num:
    def __init__(self, value):
        self.value = int(value)
        self.type = "i64"

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __add__(self, other):
        return Num(self.value + other.value)

    def __sub__(self, other):
        return Num(self.value - other.value)

    def __mul__(self, other):
        return Num(self.value * other.value)

    def __truediv__(self, other):
        return Num(self.value / other.value)

    def __neg__(self):
        return Num(self.value * -1)

    def __lt__(self, other):
        return Bool.from_bool(self.value < other.value)

    def __le__(self, other):
        return Bool.from_bool(self.value <= other.value)

    def __gt__(self, other):
        return Bool.from_bool(self.value > other.value)

    def __ge__(self, other):
        return Bool.from_bool(self.value >= other.value)

    def __equals__(self, other):
        return Bool.from_bool(isinstance(other, Num) and self.value == other.value)

    def __not_equals__(self, other):
        return Bool.from_bool(isinstance(other, Num) and self.value != other.value)

    def __eq__(self, other):
        return isinstance(other, Num) and self.value == other.value

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Null:
    def __init__(self, type):
        self.value = "null"
        self.type = type

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __eq__(self, other):
        return isinstance(other, Null)

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string

class Bool:
    def __init__(self, val):
        self.value = 1 if val == "true" else 0
        self.type = "i64"

    @classmethod
    def from_bool(cls, bool):
        return cls("true" if bool else "false")

    def add_use(self, use):
        return

    def set_definition(selfself, definition):
        return

    def __and__(self, other):
        return Bool.from_bool(self.__bool__() and other.__bool__())

    def __or__(self, other):
        return Bool.from_bool(self.__bool__() or other.__bool__())

    def __not__(self):
        return Bool.from_bool(not self)

    def __bool__(self):
        return self.value == 1

    def __equals__(self, other):
        return Bool.from_bool(isinstance(other, Bool) and self.value == other.value)

    def __not_equals__(self, other):
        return Bool.from_bool(isinstance(other, Bool) and self.value != other.value)

    def __eq__(self, other):
        return isinstance(other, Bool) and self.value == other.value

    def __str__(self):
        string = ""
        string += "{}".format(self.value)
        return string