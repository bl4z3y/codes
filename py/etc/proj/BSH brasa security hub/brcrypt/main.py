import brcrypting

file = input("Nome do arquivo: ")
_ = int(input("Criptografar ou descriptografar? <1 2> "))
if _ == 1:
    brcrypting.cryptFile(file)
elif _ == 2:
    brcrypting.decryptFile(file)

