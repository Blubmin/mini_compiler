from cfg.Instruction import BrInstruction, JumpInstruction, PhiInstruction
from cfg.Literal import Bool
from cfg.Register import Register
from sccp.Edge import Edge

values = {}
edges = []

flow_wl = []
ssa_wl = []

BOTTOM = "B"
TOP = "T"

def has_been_visited(b):
    return "visited" in b.__dict__

def is_executable(pred, succ):
    test = Edge(pred, succ)
    e = [e for e in edges if e == test]
    return e[0].executable

def add_edge(pred, dest):
    global flow_wl
    test = Edge(pred, dest)
    e = [e for e in edges if e == test]
    flow_wl += e

def set_ssa(reg, val):
    global ssa_wl, values
    prev = values[reg.id]
    if prev != val and reg.id not in ssa_wl:
        ssa_wl += [reg.id]
    values[reg.id] = val

def get_val(reg):
    if not isinstance(reg, Register):
        return reg
    return values[reg.id]

def analyze_load(l):
    set_ssa(l.target, BOTTOM)

def analyze_bin(opr):
    def chk(b):
        lft = get_val(b.lft)
        rht = get_val(b.rht)

        if BOTTOM in [lft, rht]:
            set_ssa(b.target, BOTTOM)
            return

        if TOP in [lft, rht]:
            set_ssa(b.target, TOP)
            return

        if (opr == "__floordiv__" and rht.value == 0):
            set_ssa(b.target, BOTTOM)
            return

        res = getattr(lft, opr)(rht)
        set_ssa(b.target, res)
    return chk

def analyze_uni(opr):
    def chk(b):
        source = get_val(b.source)

        if BOTTOM == source:
            set_ssa(b.target, BOTTOM)
            return

        if TOP == source:
            set_ssa(b.target, TOP)
            return

        res = getattr(source, opr)()
        set_ssa(b.target, res)
    return chk

def analyze_jump(bl):
    def curry(j):
        add_edge(bl, j.dest)
    return curry

def analyze_icmp(c):
    options = {
        "slt": analyze_bin("__lt__"),
        "sle": analyze_bin("__le__"),
        "sgt": analyze_bin("__gt__"),
        "sge": analyze_bin("__le__"),
        "eq": analyze_bin("__equals__"),
        "ne": analyze_bin("__not_equals__")
    }
    options[c.cond](c)

def analyze_br(bl):
    def curry(b):
        cond = get_val(b.cond)

        if cond == BOTTOM:
            add_edge(bl, b.true)
            add_edge(bl, b.false)
            return

        if cond == TOP:
            return

        if (cond):
            add_edge(bl, b.true)
        else:
            add_edge(bl, b.false)
    return curry

def analyze_malloc(m):
    set_ssa(m.target, BOTTOM)

def analyze_bitcast(b):
    set_ssa(b.target, get_val(b.source))

def analyze_gep(g):
    set_ssa(g.target, BOTTOM)

def analyze_call(c):
    if c.target is None:
        return
    set_ssa(c.target, BOTTOM)

def analyze_phi(p):
    vals = [get_val(r) for r in [s["value"] for s in p.sources]]
    vals = [v for v in vals if v != TOP]
    if (BOTTOM in vals):
        set_ssa(p.target, BOTTOM)
        return

    if vals:
        is_bottom = True
        val = vals[0]
        for i in range(1, len(vals)):
            res = val == vals[i]
            is_bottom &= res

        if not is_bottom:
            set_ssa(p.target, BOTTOM)
        else:
            set_ssa(p.target, val)

def analyze_instruction(bl, i):
    options = {
        "LoadInstruction": analyze_load,
        "AddInstruction": analyze_bin("__add__"),
        "SubInstruction": analyze_bin("__sub__"),
        "MultInstruction": analyze_bin("__mul__"),
        "DivInstruction": analyze_bin("__truediv__"),
        "NegInstruction": analyze_uni("__neg__"),
        "AndInstruction": analyze_bin("__and__"),
        "OrInstruction": analyze_bin("__or__"),
        "NotInstruction": analyze_uni("__not__"),
        "PrintInstruction": lambda x: x,
        "ReadInstruction": lambda x: x,
        "JumpInstruction": analyze_jump(bl),
        "ICmpInstruction": analyze_icmp,
        "BrInstruction": analyze_br(bl),
        "StoreInstruction": lambda x: x,
        "MallocInstruction": analyze_malloc,
        "FreeInstruction": lambda x: x,
        "GetElementPtrInstruction": analyze_gep,
        "BitcastInstruction": analyze_bitcast,
        "ZextInstruction": analyze_bitcast,
        "TruncInstruction": analyze_bitcast,
        "CallInstruction": analyze_call,
        "PhiInstruction": analyze_phi,
        "RetInstruction": lambda x: x
    }
    options[i.__class__.__name__](i)

def analyze_phis(b):
    for i in b.instructions:
        if isinstance(i, PhiInstruction):
            analyze_phi(i)

def analyze_block(b):
    b.visited = True
    for i in b.instructions:
        analyze_instruction(b, i)

def init_edges(f):
    global edges
    edges = []
    for b in f.blocks:
        for s in b.successors:
            edges += [Edge(b, s)]

def init_values(f):
    global values
    values = {}
    for r in [f.registers[r] for r in f.registers]:
        if r in [p.reg for p in f.params]:
            values[r.id] = BOTTOM
        else:
            values[r.id] = TOP

def analyze_func(f):
    global flow_wl, ssa_wl
    flow_wl = []
    ssa_wl = []
    init_edges(f)
    init_values(f)

    analyze_block(f.entry)

    while ssa_wl or flow_wl:
        item = flow_wl.pop(0) if flow_wl else f.registers[ssa_wl.pop(0)]

        if isinstance(item, Edge):
            item.exec()
            if not has_been_visited(item.dec):
                analyze_block(item.dec)
            else:
                analyze_phis(item.dec)
        else:
            for u in item.uses:
                if isinstance(u, PhiInstruction):
                    analyze_phi(u)
                elif has_been_visited(u.block):
                    analyze_instruction(u.block, u)

def rewrite_uses(f):
    for v in values:
        r = f.registers[v]
        val = get_val(r)
        if (val in [BOTTOM, TOP]):
            continue
        for use in r.uses:
            use.replace(r, val)
        r.uses = []

def fix_branches(f):
    f.blocks = [b for b in f.blocks if has_been_visited(b)]
    for b in f.blocks:
        b.predecessors = [p for p in b.predecessors if is_executable(p, b)]
        b.successors = [s for s in b.successors if is_executable(b, s)]
        br = b.instructions.pop()
        if isinstance(br, BrInstruction) and isinstance(br.cond, Bool):
            if bool(br.cond):
                br = JumpInstruction(br.true)
            else:
                br = JumpInstruction(br.false)
        b.instructions += [br]

    for b in f.blocks:
        for p in [i for i in b.instructions if isinstance(i, PhiInstruction)]:
            p.sources = [s for s in p.sources if is_executable(s["location"], b)]
            if len(p.sources) == 1:
                f.replace(p.target, p.sources[0]["value"])

def propagate(cfg):
    for f in [cfg[f] for f in cfg]:
        analyze_func(f)
        rewrite_uses(f)
        fix_branches(f)
    return cfg