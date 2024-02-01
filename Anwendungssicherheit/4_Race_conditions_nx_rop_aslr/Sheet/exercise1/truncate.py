#!/usr/bin/python3

import socket
import telnetlib

s = socket.create_connection(('localhost', 2001))

SERVICE_NAME = 'orientation'
MESSAGE_NAME = 'test'

def truncate_message(s):
    data = 'truncate_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = str(2064) + '\n'
    s.send(data.encode('ASCII'))
    data = 'quit\n'
    s.send(data.encode('ASCII'))



truncate_message(s)

t = telnetlib.Telnet()
t.sock = s
t.interact()
s.close()
