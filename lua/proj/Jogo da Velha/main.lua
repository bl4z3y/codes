Jogando = true

local function mostrarJogo()
  print(string.format("\n%s | %s | %s\n----------\n%s | %s | %s\n----------\n%s | %s | %s",
    Jogo[1][1], Jogo[1][2], Jogo[1][3],
    Jogo[2][1], Jogo[2][2], Jogo[2][3],
    Jogo[3][1], Jogo[3][2], Jogo[3][3]))
end

local function vezdoP(p)
  if p == 1 then
    mostrarJogo()
    print("\nP1 Coluna | (1,2,3): ")
    local c = io.read()
    c = tonumber(c)

    print("P1 Linha _ (1,2,3): ")
    local l = io.read()
    l = tonumber(l)
    os.execute("clear")
    return l, c

  elseif p == 2 then
    mostrarJogo()
    print("\nP2 Coluna | (1,2,3): ")
    local c = io.read()
    c = tonumber(c)

    print("P2 Linha _ (1,2,3): ")
    local l = io.read()
    l = tonumber(l)
    os.execute("clear")
    return l, c
  end
end

local function botJoga()
  while true do
    local c = math.random(1, 3)
    local l = math.random(1, 3)
    if Jogo[l][c] == "#" then
      Jogo[l][c] = "O"
      return
    end
  end
end

local function p1won()
  --TODAS AS MANEIRAS POSSÍVEIS DE GANHAR AI MINHA CABEÇA -400 DE QI
  --[[      LINHA || COLUNA]]
  if ((Jogo[1][1] == "X") and (Jogo[2][1] == "X") and (Jogo[3][1] == "X")) --[[L X|X|X]]
  or ((Jogo[1][2] == "X") and (Jogo[2][2] == "X") and (Jogo[3][2] == "X")) --[[M X|X|X]]
  or ((Jogo[1][3] == "X") and (Jogo[2][3] == "X") and (Jogo[3][3] == "X")) --[[R X|X|X]]
  or ((Jogo[1][1] == "X") and (Jogo[1][2] == "X") and (Jogo[1][3] == "X")) --[[U X-X-X]]
  or ((Jogo[3][1] == "X") and (Jogo[3][2] == "X") and (Jogo[3][3] == "X")) --[[D X-X-X]]
  or ((Jogo[2][1] == "X") and (Jogo[2][2] == "X") and (Jogo[2][3] == "X")) --[[M X-X-X]]
  or ((Jogo[1][1] == "X") and (Jogo[2][2] == "X") and (Jogo[3][3] == "X")) --[[H X\X\X]]
  or ((Jogo[3][1] == "X") and (Jogo[2][2] == "X") and (Jogo[1][3] == "X")) --[[H X/X/X]] then
    mostrarJogo()
    if Mode == "s" then
      print("\nVocê venceu!")
    elseif Mode == "m" then
      print("\nJogador 1 venceu!")
    end
    Jogando = false
    PlayAgain()
    return
  end
end

local function p2won()
  --TODAS AS MANEIRAS POSSÍVEIS DE PERDER AI CONTROL C CONTROL V +4000 DE QI
  --[[      LINHA || COLUNA]]
  if ((Jogo[1][1] == "O") and (Jogo[2][1] == "O") and (Jogo[3][1] == "O")) --[[L O|O|O]]
  or ((Jogo[1][2] == "O") and (Jogo[2][2] == "O") and (Jogo[3][2] == "O")) --[[M O|O|O]]
  or ((Jogo[1][3] == "O") and (Jogo[2][3] == "O") and (Jogo[3][3] == "O")) --[[R O|O|O]]
  or ((Jogo[1][1] == "O") and (Jogo[1][2] == "O") and (Jogo[1][3] == "O")) --[[U O-O-O]]
  or ((Jogo[3][1] == "O") and (Jogo[3][2] == "O") and (Jogo[3][3] == "O")) --[[D O-O-O]]
  or ((Jogo[2][1] == "O") and (Jogo[2][2] == "O") and (Jogo[2][3] == "O")) --[[M O-O-O]]
  or ((Jogo[1][1] == "O") and (Jogo[2][2] == "O") and (Jogo[3][3] == "O")) --[[H O\O\O]]
  or ((Jogo[3][1] == "O") and (Jogo[2][2] == "O") and (Jogo[1][3] == "O")) --[[H O/O/O]] then
    mostrarJogo()
    if Mode == "s" then
      print("\nVocê perdeu!")
    elseif Mode == "m" then
      print("\nJogador 2 venceu!")
    end
    Jogando = false
    PlayAgain()
    return
  end
end

local function draw()
  --TODAS AS MANEIRAS POSSÍVEIS DE EMPATAR AI CONTROL C CONTROL V +4000 DE QI
  --[[      LINHA || COLUNA]]
  if ((Jogo[1][1] ~= "#") and (Jogo[1][2] ~= "#") and (Jogo[1][3] ~= "#") and
      (Jogo[2][1] ~= "#") and (Jogo[2][2] ~= "#") and (Jogo[2][3] ~= "#") and
      (Jogo[3][1] ~= "#") and (Jogo[3][2] ~= "#") and (Jogo[3][3] ~= "#")) then
    mostrarJogo()
    print("Deu velha!")
    Jogando = false
    PlayAgain()
    return
  end
end

function PlayAgain()
  print("Jogar de novo (s n)? ")
  local o = io.read()
  if (o ~= "s") then
    os.exit()
  else
    Jogo = {{ "#", "#", "#" }, { "#", "#", "#" }, { "#", "#", "#" }}
    Jogando = true
    os.execute("clear")
    P1, P2 = true, false
    Main()
  end
end

Jogo = {{ "#", "#", "#" }, { "#", "#", "#" }, { "#", "#", "#" }}

function Main()
  local primeiraJogada = true
  print("Bem vindo ao Jogo da Velha em Lua!\n\nSingleplayer ou Multiplayer? (s m)")
  Mode = io.read()

  if Mode == "s" then --[[SINGLEPLAYER E PA-I COMPLETO]]
    while Jogando do
      ::singlecontinue::
      mostrarJogo()
      print("\nColuna | (1,2,3): ")
      local col = io.read()
      col = tonumber(col)

      print("Linha _ (1,2,3): ")
      local linha = io.read()
      linha = tonumber(linha)
      os.execute("clear")

      if linha > 3 or col > 3 then
        os.execute("clear")
        print("Digite um valor válido!")
        goto singlecontinue
      elseif Jogo[linha][col] == "X" then
        os.execute("clear")
        print("Você já jogou aí")
        goto singlecontinue
      elseif Jogo[linha][col] == "O" then
        os.execute("clear")
        print("Bot já jogou aí")
        goto singlecontinue
      else
        Jogo[linha][col] = "X"
        draw()
        botJoga()
      end
    p1won()
    p2won()
    draw()
    end

  elseif Mode == "m" then --[[MULTIPLAYER PA-I COMPLETO]]
    local P1, P2 = true, false
    while Jogando do

      if primeiraJogada then
        ::multifirstcontinue::
        linha1, col1 = vezdoP(1)
        --[[PA-I FUNCIONAL]]
        if linha1 > 3 or col1 > 3 then
          print("Digite um valor válido!")
          goto multifirstcontinue
        else
          Jogo[linha1][col1] = "X"
          primeiraJogada = false
          P1, P2 = false, true
        end
      end

      while P1 do
        linha1, col1 = vezdoP(1)
        if linha1 > 3 or col1 > 3 then
          os.execute("clear")
          print("Digite um valor válido!")
        elseif Jogo[linha1][col1] == "O" then
          os.execute("clear")
          print("Jogador 2 já jogou aí")
        elseif Jogo[linha1][col1] == "X" then
          os.execute("clear")
          print("Você já jogou aí")
        else
          Jogo[linha1][col1] = "X"
          p1won()
          p2won()
          draw()
          P1, P2 = false, true
        end
      end

      while P2 do
        linha2, col2 = vezdoP(2)
        if linha2 > 3 or col2 > 3 then
          os.execute("clear")
          print("Digite um valor válido!")
        elseif Jogo[linha2][col2] == "X" then
          os.execute("clear")
          print("Jogador 1 já jogou aí")
        elseif Jogo[linha2][col2] == "O" then
          os.execute("clear")
          print("Você já jogou aí")
        else
          Jogo[linha2][col2] = "O"
          p1won()
          p2won()
          draw()
          P1, P2 = true, false
        end
      end
    end
  end
end

Main()
