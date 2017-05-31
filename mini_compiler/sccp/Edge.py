class Edge:
    def __init__(self, prec, dec):
        self.prec = prec
        self.dec = dec
        self.executable = False

    def exec(self):
        self.executable = True

    def __eq__(self, other):
        res = True
        res = res and self.prec == other.prec
        res = res and self.dec == other.dec
        return res