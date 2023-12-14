local inspect = require('inspect')

Opcoes = {}
Escolhidos = {}
I = 1
while O ~= ";END" do
    print(string.format("\nOpção %d:", I))
    O = io.read()
    table.insert(Opcoes, O)
    I = I + 1
end
if Opcoes[#Opcoes] == ";END" then
    table.remove(Opcoes, #Opcoes)
end

print("\nMelhor de:")
local m = io.read()


function EncontrarVencedor(opcs)
  local contagem = {}

  for _, valor in ipairs(opcs) do
    if contagem[valor] then
      contagem[valor] = contagem[valor] + 1
    else
      contagem[valor] = 1
    end
  end

  local maisFrequente
  local contagemMAX = 0

  for valor, freq in pairs(contagem) do
    if freq > contagemMAX then
      contagemMAX = freq
      maisFrequente = valor
    end
  end

  return maisFrequente
end

for i = 1, m, 1 do
--Escolhendo um item
  local r = Opcoes[math.random(1, #Opcoes)]
  print(string.format("Rodada %d: %s\n", i, r))
  Escolhidos[i] = r
end

--print(string.format("\nVencedor: %s", EncontrarVencedor(Opcoes)))
