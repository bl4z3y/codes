var prompt = require('prompt-sync')();
console.log("EAE");
var salute = "Beleza?";
for (var i = 0; i < 5; i++) {
    console.log(salute);
}
var response = prompt("RESPONDE: ");
if (response == "s") {
    console.log("ent ta bom");
}
else {
    console.log("mal educado...");
}
var response2 = prompt("\nGostou do meu primeiro script em js? ");
if (response !== "s" && response2 !== "s") {
    console.log("vaza daqui voce me odeia");
}
else if ((response == "s" && response2 !== "s") || (response !== "s" && response2 == "s")) {
    console.log("bipolar esquisito");
}
else if (response == "s" && response2 == "s") {
    console.log("vlw cara tamo junto");
}
