import os
import random

os.setgroups([65534])
os.setgid(65534)
os.setuid(65534)
del os

whitelist = 'abcdefghijklmnopqrstuvwxyz().=|0123456789,'

def myflag():
    print("DevFest22{XXXXXXXXXXXXXXX}")

if __name__ == '__main__':
    s = input("You only get once chance: ").lower()
    if "myflag" in s or any(c not in whitelist for c in s):
        print("NAAH!")
        exit()
    try : eval(s)
    except : pass
