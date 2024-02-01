#!/usr/bin/python3

import base64
import angr
import claripy
import pwn

FILENAME = 'binary'
conn = pwn.remote('localhost', 2001)



def write_binary(data, filepath):
    try:
        with open(filepath, 'wb') as file:
            file.write(data)
        return True
    except Exception as ex:
        print(f"Error writing bytes to file: {ex}")
        return False


def find_input():
    proj = angr.Project(FILENAME)
    arg = claripy.BVS('arg', 32 * 8)
    state = proj.factory.entry_state(args=[proj.filename, arg])
    simgr = proj.factory.simulation_manager(state)
    simgr.explore(find=proj.loader.main_object.get_symbol('print_flag').rebased_addr)
    print(simgr)
    if len(simgr.found) > 0:
        return simgr.found[0].solver.eval(arg, cast_to=bytes)



print(conn.recvline())
data = base64.b64decode(conn.recvline())
write_binary(data, FILENAME)
print('Received binary')
required_input = find_input()
print('Found required input')
conn.sendline(required_input)



conn.interactive()
conn.close()
