#!/usr/bin/env python3

import random

whitelist = 'abcdefghijklmnopqrstuvwxyz().=|'

def myflag():
    print("DevFest22{XXXXXXXXXXXXXXXXXXXXX}")

if __name__ == '__main__':
    s = input("You only get once chance: ").lower()
    del __builtins__.input
    del __builtins__.open
    if "myflag" in s or any(c not in whitelist for c in s):
        print("NAAH!")
        exit()
    try : eval(s)
    except : pass
