from Crypto.Util.number import getPrime
from Crypto.Util.number import bytes_to_long
from Crypto.Util.number import long_to_bytes
from flag import FLAG

n = getPrime(256)*getPrime(256)
e = 65537

def padd(pt, k):
    l = len(pt)
    mod = l % k
    return pt + (k-mod)*chr(k-mod) if mod else pt

def enc(pt):
    pt = bytes_to_long(pt.encode())
    return pow(pt,e,n)

def KRSA(pt, k):
    pt = padd(pt, k)
    return "".join(long_to_bytes(enc(pt[i:i+k])).hex() for i in range(0,len(pt),k)) 
        
def main():
    k = int(input("K : "))
    assert k > 0 
    ct = KRSA(FLAG, k)
    print(f"n  : {n}")
    print(f"e  : {e}")
    print(f"k  : {k}")
    print(f"ct : {ct}")



if __name__ == "__main__":
    main()