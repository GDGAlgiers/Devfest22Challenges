from string import printable
from Crypto.Util.number import bytes_to_long ,long_to_bytes
from base64 import b64decode
import gmpy2
enc = open('../challenge/flag.enc').read()

K1= 1337
K2 = (3,1337)
K3 = "1337"
K4 = (2,int('1337'*41))

#Some useful functions:
def my_ord(c): return printable.find(c)
def my_chr(i): return printable[i]



def decrypt0x1(_input, k): #Caesar cipher
    return ''.join(my_chr((my_ord(i)-k)%100) for i in _input)
def decrypt0x2(_input,a,b): #Affine cipher
    a_rev = pow(a, -1, 100)
    return ''.join(my_chr((a_rev*(my_ord(i)-b))%100) for i in _input)
def decrypt0x3(_input, k): #Vigenere cipher
    return ''.join(my_chr((my_ord(_input[i])-my_ord(k[i%len(k)]))%100) for i in range(len(_input)))
def decrypt0x4(_input,e,n): #RSA
    return long_to_bytes(gmpy2.iroot(bytes_to_long(b64decode(_input)),e)[0])


def main():
    c4 = decrypt0x4(enc,K4[0],K4[1])
    c3 = decrypt0x3(c4.decode(),K3)
    c2 = decrypt0x2(c3,K2[0],K2[1])
    flag = decrypt0x1(c2,K1)
    print(flag)
if __name__ == '__main__':
    main()
