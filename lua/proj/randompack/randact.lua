CurrentTime = os.date("*t", os.time())
MANHA = {8,12}
TARDE = {13,17}
NOITE = {18,7}

Acts = {{"20 flexões", "Tocar guitarra", "Programar", "Assistir TV", "Mexer no celular", "NGG Impossível", "JDV"}, {"20 flexões", "Programar", "NGG Impossível", "JDV"}, {"Tocar guitarra", "Mexer no celular", "Assistir TV"}}

print(string.format("Horário = %d:%d", CurrentTime.hour, CurrentTime.min))

if CurrentTime.hour >= MANHA[1] and CurrentTime.hour <= MANHA[2] then
  print("Está de manhã e a atividade é: " .. Acts[1][math.random(1,#Acts[1])])
elseif CurrentTime.hour >= TARDE[1] and CurrentTime.hour <= TARDE[2] then
  print("Está de tarde e a atividade é: " .. Acts[2][math.random(1,#Acts[2])])
elseif CurrentTime.hour >= NOITE[1] --[[and CurrentTime.hour <= NOITE[2]] then
  print("Está de noite e a atividade é: " .. Acts[3][math.random(1,#Acts[3])])
end
