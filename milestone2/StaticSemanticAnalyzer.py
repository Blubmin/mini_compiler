import sys


class SemanticError(Exception):
    pass


symbol_table = {}


def fail_with_message(l, m):
    print("Error: line {}, {}".format(l, m), file=sys.stderr)
    raise SemanticError()


def check_attribute(typ, attr):
    if attr in symbol_table["types"][typ]:
        return symbol_table["types"][typ][attr]
    return None


def check_lvalue(st, lvalue):
    attributes = []
    current = lvalue
    while "left" in current:
        attributes.append(current["id"])
        current = current["left"]

    ltype = check_var(st, current)

    while len(attributes) > 0:
        current = attributes.pop()
        ltype = check_attribute(ltype, current)
        if ltype is None:
            fail_with_message(current["line"], "type '{}' has no attribute '{}'".format(ltype, current))

    return ltype


def enforce_unary_type(st, uni, type1):
    type2 = check_expression(st, uni["operand"])
    if type1 != type2:
        fail_with_message(uni["operand"]["line"],
                          "operand of operator '{}' must be of type '{}'".format(uni["operator"], type1))

    return type1


def enforce_bin_type(st, bi, typ):
    type1 = check_expression(st, bi["lft"])
    if type1 != typ:
        fail_with_message(bi["lft"]["line"],
                          "left operand of operator '{}' must be of type '{}'".format(bi["operator"], typ))
    type2 = check_expression(st, bi["rht"])
    if type2 != typ:
        fail_with_message(bi["rht"]["line"],
                          "right operand of operator '{}' must be of type '{}'".format(bi["operator"], typ))
    return typ


def check_bin_int_struct(st, bi):
    type1 = check_expression(st, bi["lft"])
    if type1 == "bool":
        fail_with_message(bi["lft"]["line"],
                          "left operand of operator '{}' cannot be of type 'bool'".format(bi["operator"]))
    type2 = check_expression(st, bi["rht"])
    if type1 != type2 and not (type1 != "int" and type2 == "null"):
        fail_with_message(bi["rht"]['line'],
                          "right operand of operator '{}' must match type of left operand".format(bi["operator"]) +
                          "\n\t   expected type '{}', found type '{}'".format(type1, type2))
    return "bool"


def check_bin_ints(st, bi):
    return enforce_bin_type(st, bi, "int")


def check_bin_ints_ret_bool(st, bi):
    enforce_bin_type(st, bi, "int")
    return "bool"


def check_bin_bools(st, bi):
    return enforce_bin_type(st, bi, "bool")


def check_binary(st, bi):
    options = {
        "+": check_bin_ints,
        "-": check_bin_ints,
        "*": check_bin_ints,
        "/": check_bin_ints,
        "<": check_bin_ints_ret_bool,
        ">": check_bin_ints_ret_bool,
        "<=": check_bin_ints_ret_bool,
        ">=": check_bin_ints_ret_bool,
        "&&": check_bin_bools,
        "||": check_bin_bools,
        "==": check_bin_int_struct,
        "!=": check_bin_int_struct
    }

    return options[bi["operator"]](st, bi)


def check_unary_bool(st, uni):
    return enforce_unary_type(st, uni, "bool")


def check_unary_int(st, uni):
    return enforce_unary_type(st, uni, "int")


def check_unary(st, uni):
    options = {
        "!": check_unary_bool,
        "-": check_unary_int
    }

    return options[uni["operator"]](st, uni)


def check_dot(st, dot):
    typ = check_expression(st, dot["left"])
    if dot["id"] not in symbol_table["types"][typ]:
        fail_with_message(dot["line"], "type '{}' has no attribute '{}'".format(typ, dot["id"]))
    return symbol_table["types"][typ][dot["id"]]


def check_var(st, var):
    if var["id"] in st:
        return st[var["id"]]
    if var["id"] in symbol_table["global"]:
        return symbol_table["global"][var["id"]]
    fail_with_message(var["line"], "identifier '{} invalid".format(var["id"]))


def check_invocation(st, inv):
    if inv["id"] not in symbol_table["functions"]:
        fail_with_message(inv["line"], "function '{}' does not exist".format(inv["id"]))
    func = symbol_table["functions"][inv["id"]]
    params = func["_params"]
    if len(params) != len(inv["args"]):
        fail_with_message(inv["line"],
                          "function '{}' expects {} arguments, given {}".format(inv["id"],
                                                                                len(params),
                                                                                len(inv["args"])))
    for i in range(len(params)):
        type1 = func[params[i]]
        type2 = check_expression(st, inv["args"][i])
        if type1 != type2 and not (type1 != "int" and type1 != "bool" and type2 == "null"):
            fail_with_message(inv["args"][i]["line"],
                              "argument #{} of function '{}' expects type '{}', not '{}'".format(i,
                                                                                                 inv["id"],
                                                                                                 type1,
                                                                                                 type2))
    return func["_return"]


def check_new(st, exp):
    if exp["id"] not in symbol_table["types"]:
        fail_with_message(exp["line"], "struct type '{}' invalid".format(exp["id"]))
    return exp["id"]


def check_expression(st, exp):
    options = {
        "read": lambda x, y: "int",
        "binary": check_binary,
        "unary": check_unary,
        "num": lambda x, y: "int",
        "false": lambda x, y: "bool",
        "true": lambda x, y: "bool",
        "null": lambda x, y: "null",
        "dot": check_dot,
        "id": check_var,
        "invocation": check_invocation,
        "new": check_new
    }

    return options[exp["exp"]](st, exp)


def analyze_type_field(st, field):
    if field["id"] in st:
        fail_with_message(field["line"], "field '{}' already exists".format(field["id"]))
    if field["type"] not in symbol_table["types"]:
        fail_with_message(field["line"], "type '{}' invalid".format(field["type"]))

    st[field["id"]] = field["type"]


def analyze_type(st, typ):
    if typ["id"] in st:
        fail_with_message(typ["line"], "type '{}' already exists".format(typ["id"]))

    st[typ["id"]] = {}
    for field in typ["fields"]:
        analyze_type_field(st[typ["id"]], field)


def analyze_types(st, types):
    st["int"] = "int"
    st["bool"] = "bool"
    st["void"] = "void"
    for typ in types:
        analyze_type(st, typ)


def analyze_declaration(st, dec):
    if dec["id"] in st:
        fail_with_message(dec["line"], "identifier '{}' already exists".format(dec["id"]))
    if dec["type"] not in symbol_table["types"]:
        fail_with_message(dec["line"], "type '{}' invalid".format(dec["type"]))

    st[dec["id"]] = dec["type"]


def analyze_declarations(st, decs):
    for dec in decs:
        analyze_declaration(st, dec)


def analyze_block(st, stmt):
    analyze_statements(st, stmt["list"])


def analyze_assign(st, stmt):
    type1 = check_lvalue(st, stmt["target"])
    type2 = check_expression(st, stmt["source"])
    if type1 != type2 and not (type1 != "int" and type1 != "bool" and type1 != "null" and type2 == "null"):
        fail_with_message(stmt["source"]["line"],
                          "cannot assign a value of type '{}' to lvalue of type '{}'".format(type2, type1))


def analyze_return(st, stmt):
    if "exp" not in stmt and st["_return"] != "void":
        fail_with_message(stmt["line"], "function missing return value of type '{}'".format(st["_return"]))
    elif "exp" not in stmt and st["_return"] == "void":
        return

    type1 = st["_return"]
    type2 = check_expression(st, stmt["exp"])
    if type1 != type2 and not (type1 != "int" and type1 != "bool" and type1 != "null" and type2 == "null"):
        fail_with_message(stmt["exp"]["line"], "function must return type '{}', not '{}'".format(type1, type2))


def analyze_if(st, stmt):
    typ = check_expression(st, stmt["guard"])
    if typ != "bool":
        fail_with_message(stmt["guard"]["line"],
                          "guard of if statement must result in type 'bool', not '{}'".format(typ))
    analyze_statement(st, stmt["then"])
    if "else" in stmt:
        analyze_statement(st, stmt["else"])


def analyze_while(st, stmt):
    typ = check_expression(st, stmt["guard"])
    if typ != "bool":
        fail_with_message(stmt["guard"]["line"],
                          "guard of while statement must result in type 'bool', not '{}'".format(typ))
    analyze_statement(st, stmt["body"])


def analyze_invocation(st, stmt):
    check_invocation(st, stmt)


def analyze_print(st, stmt):
    typ = check_expression(st, stmt["exp"])
    if typ != "int":
        fail_with_message(stmt["exp"]["line"], "print expects type 'int', not '{}'".format(typ))


def analyze_delete(st, stmt):
    typ = check_expression(st, stmt["exp"])
    if typ in ["int", "bool", "void", "null"]:
        fail_with_message(stmt["exp"]["line"], "cannot delete reference to object of type '{}'".format(typ))


def analyze_statement(st, stmt):
    options = {
        "block": analyze_block,
        "assign": analyze_assign,
        "return": analyze_return,
        "if": analyze_if,
        "while": analyze_while,
        "invocation": analyze_invocation,
        "print": analyze_print,
        "delete": analyze_delete
    }
    options[stmt["stmt"]](st, stmt)


def analyze_statements(st, stmts):
    for stmt in stmts:
        analyze_statement(st, stmt)


def analyze_function_param(st, param):
    if param["id"] in st:
        fail_with_message(param["line"], "parameter '{}' already exists".format(param["id"]))
    if param["type"] not in symbol_table["types"]:
        fail_with_message(param["line"], "return type '{}' invalid".format(param["type"]))

    st["_params"].append(param["id"])
    st[param["id"]] = param["type"]


def analyze_function_params(st, params):
    for param in params:
        analyze_function_param(st, param)


def analyze_if_return_path(st, ifs):
    for f in ifs:
        if "else" not in f:
            continue

        ret1 = "return" in map(lambda x: x["stmt"], f["then"]["list"])
        ret2 = "return" in map(lambda x: x["stmt"], f["else"]["list"])
        if not ret1:
            ret1 = analyze_if_return_path(st, filter(lambda x: x["stmt"] == "if", f["then"]["list"]))
            if not ret1:
                continue

        if not ret2:
            ret2 = analyze_if_return_path(st, filter(lambda x: x["stmt"] == "if", f["else"]["list"]))
            if not ret2:
                continue

        return True
    return False


def analyze_return_path(st, stmts):
    if st["_return"] == "void":
        return True

    types = map(lambda x: x["stmt"], stmts)

    if "return" in types:
        return True

    if analyze_if_return_path(st, filter(lambda x: x["stmt"] == "if", stmts)):
        return True

    return False


def analyze_function(st, func):
    if func["id"] in st:
        fail_with_message(func["line"], "function '{}' already exists".format(func["id"]))
    if func["return_type"] not in symbol_table["types"]:
        fail_with_message(func["line"], "return type '{}' invalid".format(func["return_type"]))

    st[func["id"]] = {"_name": func["id"], "_ast": func, "_return": func["return_type"], "_params": []}
    analyze_function_params(st[func["id"]], func["parameters"])
    analyze_declarations(st[func["id"]], func["declarations"])
    analyze_statements(st[func["id"]], func["body"])

    if not analyze_return_path(st[func["id"]], func["body"]):
        fail_with_message(func["line"], "function '{}' does not always return".format(func["id"]))


def analyze_functions(st, funcs):
    for func in funcs:
        analyze_function(st, func)


def analyze_main():
    if "main" not in symbol_table["functions"]:
        print("Error: missing main function\n\t   required: fun main() int", file=sys.stderr)
        raise SemanticError

    main = symbol_table["functions"]["main"]
    if main["_return"] != "int":
        fail_with_message(symbol_table["functions"]["main"]["_ast"]["line"],
                          "'main' must have a return type of type 'int'\n\t   required: fun main() int")

    if len(main["_params"]) != 0:
        fail_with_message(symbol_table["functions"]["main"]["_ast"]["line"],
                          "'main' must take 0 arguments\n\t   required: fun main() int")


def analyze_tree(tree):
    symbol_table["types"] = {}
    analyze_types(symbol_table["types"], tree["types"])

    symbol_table["global"] = {}
    analyze_declarations(symbol_table["global"], tree["declarations"])

    symbol_table["functions"] = {}
    analyze_functions(symbol_table["functions"], tree["functions"])

    analyze_main()
    return symbol_table
