from cfg import utils

from cfg.Instruction import *
from cfg.Literal import *
from cfg.Local import Local
from cfg.Register import Register

class Block:
    def __init__(self, func, next, sealed=True):
        self.func = func
        self.label = utils.new_block()
        self.instructions = []
        self.predecessors = []
        self.successors = []
        self.incomplete_phis = {}
        self.locals = {}
        self.next = next
        self.sealed = sealed

    def get_label(self):
        string = ""
        string += "label %{}".format(self.label)
        return string

    def create_register(self, typ):
        reg = Register(typ, self)
        if typ != "void":
            self.func.registers[reg.id] = reg
        return reg

    def get_id(self, id):
        if id in self.locals:
            return self[id]
        else:
            if utils.stack:
                return self.func.locals[id]
            else:
                if id not in self.locals:
                    self[id] = None
                pred = [{"value": p.get_id(id), "location": p} for p in self.predecessors]
                if self.sealed:
                    if len(pred) == 1:
                        self[id] = pred[0]["value"]
                        return pred[0]["value"]
                    else:
                        res = self.create_register(pred[0]["value"].type)
                        local = Local(id, res.type, res)
                        self[id] = local
                        inst = PhiInstruction(res, res.type)
                        pred = filter(lambda x: x["value"] is not None, pred)
                        pred = [{"value":p["value"].value, "location":p["location"]} for p in pred]
                        for p in pred:
                            inst.add_source(p)
                        self.instructions = [inst] + self.instructions
                        return local
                else:
                    res = self.create_register(pred[0]["value"].type)
                    local = Local(id, res.type, res)
                    self[id] = local
                    inst = PhiInstruction(res, res.type)
                    self.incomplete_phis[id] = inst
                    return local

    def seal(self):
        if self.sealed:
            return

        self.sealed = True

        for phi in self.incomplete_phis:
            inst = self.incomplete_phis[phi]
            values = [{"value": p.get_id(phi).value, "location": p} for p in self.predecessors]
            for v in values:
                inst.add_source(v)
            self.instructions = [inst] + self.instructions

    def add_instruction(self, instruction):
        self.instructions += [instruction]
        instruction.block = self

    def add_local(self, local):
        self.locals[local.id] = local

    @staticmethod
    def convert_boolean(value, block):
        if value.type != "i1":
            cast = block.create_register("i1")
            inst = TruncInstruction(cast, value, value.type, cast.type)
            block.add_instruction(inst)
            value = cast
        return value

    def handle_store(self, source, target):
        if target.type == "i64" and source.type == "i1":
            cast = self.create_register(target.type)
            inst = ZextInstruction(cast, source, source.type, cast.type)
            self.add_instruction(inst)
            source = cast
        if target.type == "i1" and source.type == "i64":
            cast = self.create_register(target.type)
            inst = TruncInstruction(cast, source, source.type, cast.type)
            self.add_instruction(inst)
            source = cast
        if utils.stack or type(target) is not Local:
            inst = StoreInstruction(source, target, target.type)
            self.add_instruction(inst)
            self[target.id] = target
        else:
            self[target.id] = Local(target.id, target.type, source)


    def handle_num(self, num):
        return Num(num["value"])

    def handle_null(self, null):
        return Null("")

    def handle_comp(self, eq, comp):
        lft = self.traverse_expression(eq["lft"])
        rht = self.traverse_expression(eq["rht"])
        res = self.create_register("i1")
        inst = ICmpInstruction(res, lft, rht, lft.type, comp)
        self.add_instruction(inst)
        return res

    def handle_eq(self, eq):
        return self.handle_comp(eq, "eq")

    def handle_sge(self, eq):
        return self.handle_comp(eq, "sge")

    def handle_sle(self, eq):
        return self.handle_comp(eq, "sle")

    def handle_sgt(self, eq):
        return self.handle_comp(eq, "sgt")

    def handle_slt(self, eq):
        return self.handle_comp(eq, "slt")

    def handle_ne(self, eq):
        return self.handle_comp(eq, "ne")

    def handle_bin(self, bin, instruction):
        lft = self.traverse_expression(bin["lft"])
        rht = self.traverse_expression(bin["rht"])
        res = self.create_register(lft.type)
        inst = instruction(res, lft, rht, lft.type)
        self.add_instruction(inst)
        return res

    def handle_add(self, add):
        return self.handle_bin(add, AddInstruction)

    def handle_sub(self, sub):
        return self.handle_bin(sub, SubInstruction)

    def handle_mult(self, mult):
        return self.handle_bin(mult, MultInstruction)

    def handle_div(self, div):
        return self.handle_bin(div, DivInstruction)

    def handle_and(self, bin):
        return self.handle_bin(bin, AndInstruction)

    def handle_or(self, bin):
        return self.handle_bin(bin, OrInstruction)

    def handle_binary(self, bin):
        options = {
            "==": self.handle_eq,
            "!=" : self.handle_ne,
            "<=": self.handle_sle,
            ">=": self.handle_sge,
            "<": self.handle_slt,
            ">": self.handle_sgt,
            "*": self.handle_mult,
            "-": self.handle_sub,
            "+": self.handle_add,
            "/": self.handle_div,
            "&&": self.handle_and,
            "||": self.handle_or
        }

        return options[bin["operator"]](bin)

    def handle_lvalue(self, lvalue):
        if "left" in lvalue:
            lft = self.handle_lvalue(lvalue["left"])
            if utils.stack or type(lft) is not Local:
                val = self.create_register(lft.type)
                inst = LoadInstruction(lft, val, lft.type)
                self.add_instruction(inst)
            else:
                val = lft.value
            idx, id_type = utils.get_struct_index(lft.type, lvalue["id"])
            ptr = self.create_register(id_type)
            inst = GetElementPtrInstruction(lft.type, val, idx, ptr)
            self.add_instruction(inst)
            return ptr
        else:
            if "exp" in lvalue and lvalue["exp"] == "global":
                ptr = utils.get_global(lvalue["id"])
            else:
                ptr = self.get_id(lvalue["id"])
            return ptr

    def handle_dot(self, dot):
        lft = self.traverse_expression(dot["left"])
        idx, type = utils.get_struct_index(lft.type, dot["id"])
        ptr = self.create_register("{}*".format(type))
        inst = GetElementPtrInstruction(lft.type, lft, idx, ptr)
        self.add_instruction(inst)
        val = self.create_register(type)
        inst = LoadInstruction(ptr, val, type)
        self.add_instruction(inst)
        return val

    def handle_id(self, id):
        val = self.get_id(id["id"])
        if utils.stack or type(val) is not Local:
            reg = self.create_register(val.type)
            load = LoadInstruction(val, reg, val.type)
            self.add_instruction(load)
        else:
            reg = val.value
        return reg

    def handle_new(self, new):
        type = utils.get_type(new["id"])
        size = utils.get_struct_size(type)
        ptr = self.create_register("i8*")
        inst = MallocInstruction(ptr, size)
        self.add_instruction(inst)

        cast = self.create_register(type)
        inst = BitcastInstruction(cast, ptr, "i8*", type)
        self.add_instruction(inst)
        return cast

    def handle_call_exp(self, call):
        type = utils.get_fun_type(call["id"])
        args = [self.traverse_expression(a) for a in call["args"]]
        val = self.create_register(type)
        inst = CallInstruction(val, call["id"], type, args)
        self.add_instruction(inst)
        return val

    def handle_true(self, bool):
        return Bool("true")

    def handle_false(self, bool):
        return Bool("false")

    def handle_read(self, read):
        val = self.create_register("i64")
        self.add_instruction(ReadInstruction())
        inst = LoadInstruction(utils.get_scratch(), val, val.type)
        self.add_instruction(inst)
        return val

    def handle_not(self, unary):
        val = self.traverse_expression(unary["operand"])
        inv = self.create_register(val.type)
        inst = NotInstruction(inv, val, val.type)
        self.add_instruction(inst)
        return inv

    def handle_neg(self, unary):
        val = self.traverse_expression(unary["operand"])
        neg = self.create_register(val.type)
        inst = NegInstruction(neg, val, val.type)
        self.add_instruction(inst)
        return neg

    def handle_unary(self, unary):
        options = {
            "!": self.handle_not,
            "-": self.handle_neg
        }
        return options[unary["operator"]](unary)

    def handle_global(self, g):
        glob = utils.get_global(g["id"])
        res = self.create_register(glob.type)
        inst = LoadInstruction(glob, res, glob.type)
        self.add_instruction(inst)
        return res

    def traverse_expression(self, exp):
        options = {
            "num": self.handle_num,
            "null": self.handle_null,
            "binary": self.handle_binary,
            "dot": self.handle_dot,
            "id": self.handle_id,
            "new": self.handle_new,
            "invocation": self.handle_call_exp,
            "true": self.handle_true,
            "false": self.handle_false,
            "read": self.handle_read,
            "unary": self.handle_unary,
            "global": self.handle_global
        }

        return options[exp["exp"]](exp)

    def handle_return(self, ret):
        if self.func.type != "void":
            value = self.traverse_expression(ret["exp"])
            ret_local = Local(".ret", self.func.type, value)
            self.handle_store(value, ret_local)

        jump = JumpInstruction(self.func.ret)
        self.add_instruction(jump)
        self.successors += [self.func.ret]
        self.func.ret.predecessors += [self]
        self.next = self.func.ret
        return None

    def handle_assign(self, assign):
        source = self.traverse_expression(assign["source"])
        target = self.handle_lvalue(assign["target"])
        self.handle_store(source, target)
        return self

    def handle_if(self, iff):
        guard = self.traverse_expression(iff["guard"])

        after_block = Block(self.func, self.next)
        false_block = after_block
        true_block = Block(self.func, after_block)

        self.successors += [true_block]
        self.func.blocks += [true_block]
        true_block.predecessors += [self]
        if_ret = true_block.traverse_statement(iff["then"])
        last = self.func.blocks[-1]
        if last.next == after_block:
            after_block.predecessors += [last]
            last.successors += [after_block]

        if "else" in iff:
            false_block = Block(self.func, after_block)
            self.successors += [false_block]
            self.func.blocks += [false_block]
            false_block.predecessors += [self]
            else_ret = false_block.traverse_statement(iff["else"])
            last = self.func.blocks[-1]

            if last.next == after_block:
                after_block.predecessors += [last]
                last.successors += [after_block]

            if if_ret is None and else_ret is None:
                guard = Block.convert_boolean(guard, self)
                inst = BrInstruction(guard, true_block, false_block)
                self.add_instruction(inst)
                return None
        else:
            self.successors += [after_block]
            after_block.predecessors += [self]

        self.func.blocks += [after_block]

        guard = Block.convert_boolean(guard, self)
        inst = BrInstruction(guard, true_block, false_block)
        self.add_instruction(inst)
        return after_block

    def handle_block(self, block):
        cur = self
        for s in block["list"]:
            cur = cur.traverse_statement(s)
            if cur is None:
                return None

        if cur.next is None:
            return cur
        else:
            inst = JumpInstruction(cur.next)
            cur.add_instruction(inst)
            return cur.next

    def handle_print(self, prnt):
        val = self.traverse_expression(prnt["exp"])
        inst = PrintInstruction(val, prnt["endl"])
        self.add_instruction(inst)
        return self

    def handle_while(self, whle):
        after = Block(self.func, self.next)
        header = Block(self.func, after)
        body = Block(self.func, None, False)
        self.func.blocks += [header, body]

        inst = JumpInstruction(header)
        self.add_instruction(inst)
        self.successors += [header]
        header.predecessors += [self]

        res = header.traverse_expression(whle["guard"])
        res = Block.convert_boolean(res, header)
        inst = BrInstruction(res, body, after)
        header.add_instruction(inst)
        header.successors += [after, body]

        body.predecessors += [header]
        body.traverse_statement(whle["body"])
        last = self.func.blocks[-1]
        res = last.traverse_expression(whle["guard"])
        res = Block.convert_boolean(res, last)
        inst = BrInstruction(res, body, after)
        last.add_instruction(inst)
        last.successors += [body, after]
        body.predecessors += [last]
        body.seal()

        after.predecessors += [header, last]
        self.func.blocks += [after]
        return after

    def handle_call_stmt(self, call):
        type = utils.get_fun_type(call["id"])
        args = [self.traverse_expression(a) for a in call["args"]]
        inst = CallInstruction(None, call["id"], type, args)
        self.add_instruction(inst)
        return self

    def handle_delete(self, delete):
        val = self.traverse_expression(delete["exp"])
        cast = self.create_register("i8*")
        inst = BitcastInstruction(cast, val, val.type, "i8*")
        self.add_instruction(inst)
        inst = FreeInstruction(cast)
        self.add_instruction(inst)
        return self

    def traverse_statement(self, stmt):
        options = {
            "return": self.handle_return,
            "assign": self.handle_assign,
            "if": self.handle_if,
            "block": self.handle_block,
            "print": self.handle_print,
            "while": self.handle_while,
            "invocation": self.handle_call_stmt,
            "delete": self.handle_delete
        }
        return options[stmt["stmt"]](stmt)

    def traverse_tree(self, tree):
        block = self

        for s in tree:
            block = block.traverse_statement(s)
            if block is None:
                return self.next

    def __getitem__(self, item):
        return self.locals[item]

    def __setitem__(self, key, value):
        self.locals[key] = value

    def __eq__(self, other):
        return self.label == other.label

    def __str__(self):
        string = ""
        string += "{}:\n".format(self.label)
        instruction_string = ""
        for i in self.instructions:
            instruction_string += "\t{}\n".format(i)
        string += instruction_string
        return string