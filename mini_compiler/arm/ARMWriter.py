arm_file = None

def write_boilerplate():
    with open("arn_boilerplate.txt", "r") as file:
        for line in file:
            arm_file.write(line)

def write_to_file(filename, cfg):
    global arm_file
    with open(filename, "w") as file:
        arm_file = file
        write_boilerplate()
        write_type_declarations(st)
        write_globals(st)
        write_functions(cfg)