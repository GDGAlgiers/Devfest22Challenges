# My First Overflow

## Write-up

1. Function `gets` is vulnerable to buffer overflow.

2. Sending an input of size 40 or more will trigger the signal handler that prints the flag.

[Exploit script](./solve.py).
