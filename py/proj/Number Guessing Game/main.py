import random as r
import os

comp = "inteiro"
CDRPUJDEJ = r.randint(1,2)
c = 10
MIN, MAX = 1, 20
T_G = {
  'F': [10, 21],
  'N': [5, 51],
  'D': [1, 5],
  'I': [0, 3],
}
entries = []

"""
Modos de jogo:
-Fácil: 
    10 Dicas, adivinhações ilimitadas
-Normal(Médio): 
    5 Dicas, adivinhações ilimitadas
-Difícil: 
    1 Dica, 5 adivinhações 
-Impossível: 
    Sem dicas, 3 adivinhações
-Custom: 
    Tudo customizável
SECRETOS:
-GOD OF WAR: 
    Sem dicas e 1 adivinhação
-Baby Mode: 
    O jogo te fala o resultado e te chama de bebezão 

>Adicionada a Constante De Randomização Para Um Jogo Divertido E Justo (CDRPUJDEJ)
TODO: Ajustar o 'comp' (complemento)
"""

randomize = lambda MIN, MAX: r.randint(MIN, MAX)


def cls():
  os.system('clear')
  #os.system('cls')

def tip(nr, tips, min, max):
  global c, comp
  #print(f"CDRPUJDEJ: {CDRPUJDEJ}")
  if tips > 0:
    tips -= 1
    c -= 1
    if CDRPUJDEJ == 1:
      i = nr
      j = (i-c) + 3
      k = (i+c) - 3
    elif CDRPUJDEJ == 2:
      i = nr
      j = (i-c) - 3
      k = (i+c) + 3

    if j < min or j > max: j = min
    if k > max or k < min: k = max

    if c == 8:
      if nr % 2 == 0:
        comp = "par"
        print(f"\nO número é {comp} e está entre <{j}> e <{k}>\n")
        return tips, j, k
      elif nr % 2 != 0:
        comp = "ímpar"
        print(f"\nO número é {comp} e está entre <{j}> e <{k}>\n")
        return tips, j, k
      #elif



    print(f'\nO número está entre <{j}> e <{k}>\n')
    return tips, j, k
  else:
    print('\nSem dicas restantes!')


def custom():
  tips = int(input("Dicas: "))
  gus = int(input("Tentativas: "))
  min = int(input("Número mínimo: "))
  max = int(input("Número máximo: "))
  return tips, gus, min, max

def guess(min, max, nr, gm, tp, gu):
  global MIN, MAX, c, entries, comp
  g: None = None
  guD = gu

  if gm == '0': #Baby Mode
    print(f'O bebezão não sabe o número!\nO número é {nr}\n')

  while g != nr:
    if gu == 0:
      print(f"\nVocê perdeu!\nO número era {nr}")
      return
    if tp is None: tp = 0
    try:
      min = abs(min)
      if g < min or g > max:
        print(f'\nDigite um número entre {min} e {max}!')
        entries.remove(g)
        if gu != guD:
          gu += 1
          try:
            entries.remove(g)
          except:
            continue
    except TypeError: g = 0
    
    g = 0
    g = input(f"\nAdivinhe o número {comp} entre <{min} e {max}>\nDigite <D> para dica <{tp}> restantes\n{gu} tentativas sobrando: ")
    if g == '' or not g.isdigit():
      if g.upper() == "D":
        gu -= 1
      gu += 1

    try: entries.append(int(g))
    except: pass

    if g.upper() == "D":
      if tp is not None and tp > 0:
        tp, tpmin, tpmax = tip(nr, gu, min, max)
        min = tpmin
        max = tpmax
      else:
        print('\nSem dicas restantes!')
    else:
      try:
        g = int(g)
      except ValueError:
        print("Não achei o Número!!")
      gu -= 1
    if entries.count(g) > 1:
      entries.remove(g)
      print("Esse número já foi escolhido por você!\n")
      gu += 1
  else:
    print("\nVocê adivinhou o número!")

def main():
  global MIN, MAX
  
  cls()
  gm = input("\nSelecione um modo de jogo abaixo:\n1-Fácil\n2-Normal\n3-Difícil\n4-Impossível\n5-Custom\n=>")
  while True:
    nr = randomize(MIN, MAX)
    if gm == '1':
      guess(MIN, MAX, nr, gm, 10, 1000)
    elif gm == '2':
      guess(MIN, MAX, nr, gm, 5, 1000)
    elif gm == '3':
      guess(MIN, MAX, nr, gm, 1, 5)
    elif gm == '4':
      guess(MIN, MAX, nr, gm, 0, 3)
    elif gm == '5':
      tips, gue, min, max = custom()
      nr = randomize(min, max)
      guess(min, max, nr, gm, tips, gue)
    elif gm == 'GOD OF WAR':
      guess(MIN, MAX, nr, gm, 0, 1)
    elif gm == '0':
      guess(MIN, MAX, nr, gm, 1, 1)
    else:
      print("\nEscolha um modo de jogo válido! ")
      gm = input("\nSelecione um modo de jogo abaixo:\n1-Fácil\n2-Normal\n3-Difícil\n4-Impossível\n5-Custom\n=>")
    
    _ = int(input("Jogar novamente? <1; sim 2; não 3; menu> "))
    c = 10
    entries.clear()
    cls()
    if _ == 1: continue
    elif _ == 2: quit()
    elif _ == 3: main()


main()
