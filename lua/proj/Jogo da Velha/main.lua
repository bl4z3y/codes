Jogando = true

local function mostrarJogo()
  print(string.format("\n%s | %s | %s\n----------\n%s | %s | %s\n----------\n%s | %s | %s",
    Jogo[1][1], Jogo[1][2], Jogo[1][3],
    Jogo[2][1], Jogo[2][2], Jogo[2][3],
    Jogo[3][1], Jogo[3][2], Jogo[3][3]))
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

local function pwon()
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
    print("Voce venceu!")
    Jogando = false
  end
end

local function botwon()
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
    print("Voce perdeu!")
    Jogando = false
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
  end
end

Jogo = {{ "#", "#", "#" }, { "#", "#", "#" }, { "#", "#", "#" }}

while Jogando do
  mostrarJogo()
  print("\nColuna | (1,2,3): ")
  local col = io.read()
  col = tonumber(col)

  print("Linha _ (1,2,3): ")
  local linha = io.read()
  linha = tonumber(linha)
  os.execute("clear")

  if Jogo[linha][col] == "O" then
    os.execute("clear")
    print("Jogador 2 já jogou aí")
  elseif linha > 3 or col > 3 then
    os.execute("clear")
    print("Digite um valor válido!")
  else
    Jogo[linha][col] = "X"
    draw()
    botJoga()
  end

  pwon()
  botwon()
  draw()
end
