#!/usr/bin/python

import angr

# create a Project
proj = angr.Project("fauxware")

# get the entry state
entry_state = proj.factory.entry_state()

# create a path_group starting at the entry state:
simgr = proj.factory.simulation_manager(entry_state)

# try to find a path that leads to the accepted function
simgr.explore(find=proj.loader.main_object.get_symbol('accepted').rebased_addr)

# extract an input that leads to the accepted function
assert(len(simgr.found) > 0)
print(repr(simgr.found[0].posix.dumps(0)))
