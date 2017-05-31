from arm.Function import Function

def translate(cfg):
    for f in [cfg[f] for f in cfg]:
        print(Function(f))