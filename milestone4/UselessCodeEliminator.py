from cfg.Instruction import BrInstruction, JumpInstruction, PhiInstruction
from cfg.Register import Register

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
            i.critical = False
            if i.__class__.__name__ in critical_instructions:
                crits += [i]

    for i in f.ret.instructions:
        i.critical = False
        if i.__class__.__name__ in critical_instructions:
            crits += [i]

    while crits:
        i = crits.pop()
        if not i.critical:
            crits += [s.definition for s in mark_instruction(i) if isinstance(s, Register)]

def sweep(f):
    for b in f.blocks:
        b.instructions = [i for i in b.instructions if i.critical]

    f.ret.instructions =  [i for i in f.ret.instructions if i.critical]

def remove_pred(p, m, s):
    p.successors = [suc for suc in p.successors if suc != m]
    if s not in p.successors:
        p.successors += [s]
    last = p.instructions[-1]
    last.replace(m, s)

def remove_succ(p, m, s):
    s.predecessors = [pred for pred in s.predecessors if pred != m]
    if p not in s.predecessors:
        s.predecessors += [p]

def remove_middle(pred, m, s):
    for p in pred:
        p.successors = [s for s in p.successors if s != m]
        remove_pred(p, m, s)
        remove_succ(p, m, s)

    phis = [i for i in s.instructions if isinstance(i, PhiInstruction)]
    for phi in phis:
        temp = [s for s in phi.sources if s["location"] is m]
        if temp:
            for p in pred:
                phi.add_source({"value": temp[0]["value"], "location": p})
        phi.sources = [s for s in phi.sources if s not in temp]

def remove_empty_blocks(f):
    for b in f.blocks:
        b.critical = False
        b.visited = False
        b.should_remove = False

    phis = [p for p in f.ret.instructions if isinstance(p, PhiInstruction)]
    for phi in phis:
        for s in phi.sources:
            if not isinstance(s["value"], Register):
                s["location"].critical = True
                s["location"].visited = True

    blocks = [f.entry]
    while blocks:
        b = blocks.pop(0)
        b.visited = True
        if not b.critical and len(b.instructions) == 1 and isinstance(b.instructions[0], JumpInstruction):
            s = b.successors[0]

            if not [i for i in s.instructions if isinstance(i, PhiInstruction)] and len(s.predecessors) == 1:
                b.should_remove = True
                if b.predecessors:
                    remove_middle(b.predecessors, b, b.successors[0])
                else:
                    s.predecessors = []
                    f.entry = s
                    phis = [i for i in s.instructions if isinstance(i, PhiInstruction)]
                    for phi in phis:
                        phi.replace(b, s)

        blocks += [s for s in b.successors if not s.visited]

    f.blocks = [b for b in f.blocks if not b.should_remove]

def fix_br(f):
    changed = False
    for b in f.blocks:
        last = b.instructions.pop()
        if isinstance(last, BrInstruction) and last.true is last.false:
            changed = True
            last.cond.uses = [i for i in last.cond.uses if i is not last]
            last = JumpInstruction(last.true)
            b.successors = [b.successors[0]]
            b.successors[0].predecessors = [b]
        b.instructions += [last]
    return changed

def stich_blocks(f):
    changed = False

    for b in f.blocks:
        b.visited = False
    blocks = [f.entry]

    while blocks:
        b = blocks.pop(0)
        b.visited = True
        if len(b.successors) == 1 and len(b.successors[0].predecessors) == 1:
            changed = True
            s = b.successors[0]

            if s is f.ret:
                f.blocks = [blk for blk in f.blocks if blk is not b]
                f.ret = b

            b.instructions.pop()
            b.instructions += s.instructions
            b.successors = s.successors

            for suc in s.successors:
                phis = [i for i in suc.instructions if isinstance(i, PhiInstruction)]
                for phi in phis:
                    phi.replace(s, b)

            blocks += [b]
        else:
            blocks += [s for s in b.successors if not s.visited]

    f.blocks = [b for b in f.blocks if b.visited]
    return changed

def eliminate(cfg):
    for f in [cfg[f] for f in cfg]:
        while True:
            mark(f)
            sweep(f)
            remove_empty_blocks(f)
            changed = False
            changed |= stich_blocks(f)
            changed |= fix_br(f)
            if not changed:
              break
    return cfg
