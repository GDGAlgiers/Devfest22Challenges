#!/usr/bin/env python3

import os
import random

os.setgroups([65534])
os.setgid(65534)
os.setuid(65534)
#locals().get(str().join(dict(my=1,flag=2).keys()))()
del os

whitelist = 'abcdefghijklmnopqrstuvwxyz().=|0123456789,'

def myflag():
    print("DevFest22{An0th3r_JAIL_g0t_brok333333n}")

if __name__ == '__main__':
    s = input("You only get once chance: ").lower()
    if "myflag" in s or any(c not in whitelist for c in s):
        print("NAAH!")
        exit()
    try : eval(s)
    except : pass
