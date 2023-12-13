local inspect = require('inspect')

Escolhas = {}
I = 1
while o ~= ";END" do
    print(string.format("\nEscolha %d:", I))
    o = io.read()
    table.insert(Escolhas, o)
    
    I = I + 1
end
if Escolhas[#Escolhas] == ";END" then
    table.remove(Escolhas, #Escolhas)
end

--Escolhendo um item
r = Escolhas[math.random(1, #Escolhas)]
print(string.format("\n%s foi escolhido", r))
