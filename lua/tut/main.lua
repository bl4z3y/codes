--[[ Comentário multi-linhas
Globais são com a inicial maiúscula
Locais são definidas com a palavra local
Variáveis são definidas dinâmicamente
]]
local PI = math.pi

Word = "Hello, World!"
Num = 69

print(Word, PI, "\n")

print("word is a ... ", type(Word),"!!!\n")

--Funções com o a palavra function
function Quadradinho(x)
  return x*x
end

--A maioria dos statements acaba com end (ou os que tem indentação)
if type(Quadradinho) == "function" then
  print("Função Quardradinho é global e retorna x*x!!\n")
end

--pcall() é um try except voltado para funções
print(pcall(Quadradinho, 4))

--Podemos declarar métodos para uma tabela, por exemplo:
local tabela = {"Lua", "é", "incrível,", "rápida,", "e leve!"}

function tabela:show(msg)
  --pairs() itera em uma ordem aleatória e printa a função que está sendo executada também
  --ipairs() itera em ordem crescente do dicionário
  for _, v in ipairs(self) do
    io.write(v, " ")
  end
  if msg then
    print(msg)
  end
end

--Quando é usado o ponto, a função necessita dos argumentos fornecidos explicitamente
tabela.show(tabela, "ponto final")
--Quando são usados os dois pontos, a variável que veio antes dos dois pontos é o primeiro argumento passado para a função, que será convertida para self
tabela:show("self com dois pontos")

local dicio = {
  [1] = "A",
  [2] = "B",
  [3] = "C"
}

function dicio:ler()
  for k, v in ipairs(self) do
    print(string.format("%s: %s", k, v))
  end
end

dicio:ler()
