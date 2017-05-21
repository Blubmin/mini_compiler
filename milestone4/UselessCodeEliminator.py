from cfg.Register import Register
from cfg.utils import get_globals

import types

critical_instructions = [
    "StoreInstruction",
    "RetInstruction",
    "JumpInstruction",
    "BrInstruction",
    "PrintInstruction",
    "ReadInstruction",
    "CallInstruction"
]

def mark_empty(e):
    e.critical = True
    return []

def mark_bin(b):
    b.critical = True
    return [b.lft, b.rht]

def mark_store(s):
    s.critical = True
    return [s.target, s.source]

def mark_source(s):
    s.critical = True
    return [s.source]

def mark_print(p):
    p.critical = True
    return [p.value]

def mark_br(br):
    br.critical = True
    return [br.cond]

def mark_call(c):
    c.critical = True
    return c.args

def mark_phi(p):
    p.critical = True
    return [s["value"] for s in p.sources]

def mark_ret(r):
    if r.type == "void":
        return mark_empty(r)
    else:
        return mark_source(r)

def mark_instruction(i):
    options = {
        "LoadInstruction": mark_source,
        "AddInstruction": mark_bin,
        "SubInstruction": mark_bin,
        "MultInstruction": mark_bin,
        "DivInstruction": mark_bin,
        "NegInstruction": mark_source,
        "AndInstruction": mark_bin,
        "OrInstruction": mark_bin,
        "NotInstruction": mark_source,
        "PrintInstruction": mark_print,
        "ReadInstruction": mark_empty,
        "JumpInstruction": mark_empty,
        "ICmpInstruction": mark_bin,
        "BrInstruction": mark_br,
        "StoreInstruction": mark_store,
        "MallocInstruction": mark_empty,
        "FreeInstruction": mark_source,
        "GetElementPtrInstruction": mark_source,
        "BitcastInstruction": mark_source,
        "ZextInstruction": mark_source,
        "TruncInstruction": mark_source,
        "CallInstruction": mark_call,
        "PhiInstruction": mark_phi,
        "RetInstruction": mark_ret
    }

    return options[i.__class__.__name__](i)

def mark(f):
    crits = []

    params = types.SimpleNamespace(critical=True)
    for p in f.params:
        p.reg.definition = params

    for b in f.blocks:
        for i in b.instructions:
            if i.__class__.__name__ in critical_instructions:
                crits += [i]

    for i in f.ret.instructions:
        if i.__class__.__name__ in critical_instructions:
            crits += [i]

    while crits:
        i = crits.pop()
        if "critical" not in i.__dict__:
            crits += [s.definition for s in mark_instruction(i) if isinstance(s, Register)]

def sweep(f):
    for b in f.blocks:
        b.instructions = [i for i in b.instructions if "critical" in i.__dict__]

    f.ret.instructions =  [i for i in f.ret.instructions if "critical" in i.__dict__]

def eliminate(cfg):
    for f in [cfg[f] for f in cfg]:
        mark(f)
        sweep(f)
    return cfg
