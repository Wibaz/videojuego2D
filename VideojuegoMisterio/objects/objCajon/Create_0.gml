// Inherit the parent event
event_inherited();

myTextBox = noone;
myName = "Laria";

//myText[0] = "Hola, soy Laria";
//myText[1] = "Ey di algo jugador";

//Nuevo
portrait_index = 1;
voice = snd_voice2;
name = "Reed";
//global.IbukiParla = true;
if(global.IbukiParla = true){
global.FuenteDeAlimentacion = true;
text = ["¡Has conseguido la fuente de alimentacion!"];
speakers = [id];
next_line=[-1]
}
else{
text = ["(Es un cajon, parece contener baterias y pilas.)"]
speakers = [id];
next_line=[-1]
}