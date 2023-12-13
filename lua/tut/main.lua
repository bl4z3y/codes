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

while Num < 70 --[[condição]] do
  Num = Num + 1
end

for i = 0 --[[início]], 5 --[[ (i<=5) vai até 5]], 1 --[[incremento i++]] do
  print(i)
end

--pcall() é um try except voltado para funções
print(pcall(Quadradinho, 4))
