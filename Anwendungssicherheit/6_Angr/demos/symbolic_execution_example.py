#!/usr/bin/python

import angr

proj = angr.Project("symbolic_execution_example")
state = proj.factory.entry_state()
simgr = proj.factory.simulation_manager(state)
simgr.explore(find = proj.loader.main_object.get_symbol('success').rebased_addr)

assert(len(simgr.found) > 0)
print(repr(simgr.found[0].posix.dumps(0)))
with open("input.bin", "wb") as f:
    f.write(simgr.found[0].posix.dumps(0))

