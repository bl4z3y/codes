import hashlib
from os import system, getcwd
#import cesar

"""
TODO:
    >Arrumar a escrita do arquivo (\n duplo)
"""

def key_to_list(key: str):
    list_key  = []
    for d in key:
        list_key.append(d)
    return list_key

def brainf_it(l_key):
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


def cryptFile(fname: str):
    kfile: str = fname.replace(".txt", "") + ".brkey"
    path_kfile: str = getcwd() + "/" + kfile
    
    try:
        with open(fname, "r") as f:
           allines = f.readlines()
    except FileNotFoundError:
        quit()

    with open(fname, "w") as f:
        for l in allines:
            # print(f"L = '{l}'\nLR = '{l[::-1]}'")
            # print(l[::-1], end='')
            if not l.endswith("\n"):
                f.write(l[::-1] + "\n")
            elif l.endswith("\n"):
                f.write(l[::-1])
            elif l == "\n":
                f.write(l)

    key = input("Digite a chave: ")
    with open(kfile, "w") as f:
        f.write(hashlib.sha512(key.encode()).hexdigest())
        system(f'chmod 444 "{path_kfile}"')

    return

def decryptFile(fname: str):
    kfile: str = fname.replace(".txt", "") + ".brkey"
    with open(kfile, "r") as f:
        real_key = f.readline()

    key = input("Digite a chave para descriptografar: ")
    if hashlib.sha512(key.encode()).hexdigest() == real_key:
        _ = int(input("Escolha:\n1-Exibir o conteúdo do arquivo\n2-Descriptografar o arquivo\n=>"))
        with open(fname, "r") as f:
            allines = f.readlines()

        if _ == 1: # Exibir conteúdo do arquivo descriptografado
            with open(fname, "r") as f:
                for l in allines:
                    print(l[::-1], end='')

        elif _ == 2: # Descriptografar o arquivo
            with open(fname, "w") as f:
                for l in allines:
                    f.write(l[::-1])
    return

