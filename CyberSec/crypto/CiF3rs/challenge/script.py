from flag import FLAG
from string import printable
from Crypto.Util.number import bytes_to_long ,long_to_bytes
from base64 import b64encode
#My keys:
K1= 1337
K2 = (3,1337)
K3 = "1337"
K4 = (2,int('1337'*41))

#Some useful functions:
def my_ord(c): return printable.find(c)
def my_chr(i): return printable[i]


#My secure crypto functions :
def crypt0x1(_input, k):
    return ''.join(my_chr((my_ord(i)+k)%100) for i in _input)
def crypt0x2(_input,a,b):
    return ''.join(my_chr((a*my_ord(i)+b)%100) for i in _input)
def crypt0x3(_input, k):
    return ''.join(my_chr((my_ord(_input[i])+my_ord(k[i%len(k)]))%100) for i in range(len(_input)))
def crypt0x4(_input,e,n):
    return long_to_bytes(pow(bytes_to_long(_input.encode()),e,n))



def main():
    c1 = crypt0x1(FLAG,K1)
    c2 = crypt0x2(c1,K2[0],K2[1])
    c3 = crypt0x3(c2,K3)
    c4 = crypt0x4(c3,K4[0],K4[1])
    with open('flag.enc','wb+') as f:
        f.write(b64encode(c4))
if __name__ == '__main__':
    main()