import string

lowerc, upperc = [], []
NUMS = ['1','2','3','4','5','6','7','8','9','0']
for lc in string.ascii_lowercase:
    lowerc.append(lc)
for uc in string.ascii_uppercase:
    upperc.append(uc)

def shiftPhrase(phrase: str, shift: int):
    global lowerc, upperc, NUMS
    list_phr = []
    shifted_phr = ''
    shift_n = shift
    shift_l = shift
    if shift_n >= 9:
        shift_n -= 9
    if shift_l >= 26:
        shift_l -= 26
    for _ in phrase:
        list_phr.append(_)
    for l in list_phr:
        if l.islower():
            ind = lowerc.index(l) + shift_l
            shifted_phr += lowerc[ind]
        elif l.isupper():
            ind = upperc.index(l) + shift_l
            shifted_phr += upperc[ind]
        elif l.isnumeric():
            try:
                ind = NUMS.index(l) + shift_n
                shifted_phr += NUMS[ind]
            except IndexError:
                if int(l) >= 9:
                    lint = int(l) + shift_n
                    while lint > 9:
                        lint -= 10
                    shifted_phr += str(lint)
        elif l == ' ':
            shifted_phr += ' '
    print(shifted_phr)

def main():
    phrase = input("Digite a frase: ")
    shift = int(input("Digite o deslocamento: "))
    shiftPhrase(phrase, shift)


if __name__ == "__main__":
    main()
