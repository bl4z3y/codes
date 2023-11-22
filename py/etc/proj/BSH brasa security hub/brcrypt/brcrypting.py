import random
import cesar

"""
CRIPTOGRAFIA:
    -> Usa uma chave
"""

def key_to_list(key: str):
    list_key  = []
    for d in key:
        list_key.append(d)
    return list_key

def crypt_it(l_key, word=''):
    c = 0
    for d in l_key:
        if d == '1':
            print(1)
            elif d == '2':
            n_toadd = []
            for i in range(len(l_key)):
                if c == 2:
                    print(l_key)
                    n_toadd.append(l_key.pop(1))
                    c = 0
                else:
                    c += 1
            for i in n_toadd:
                l_key.append(i)
        elif d == '3':
            print(3)
        elif d == '4':
            print(4)
        elif d == '5':
            print(5)
        elif d == '6':
            print(6)
        elif d == '7':
            print(7)
        elif d == '8':
            print(l_key[::-1])
        elif d == '9':
            print(9)
        elif d == '0':
            print(0)
    print(l_key)
