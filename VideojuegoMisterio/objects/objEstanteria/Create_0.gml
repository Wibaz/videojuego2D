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
	global.FuenteDeAlimentacion = false;
text = ["¡Has conseguido un Disco Duro!.","(Ya no saben ni donde poner las cosas.)"];
speakers = [id,id];
next_line=[0,-1]
}
else {
text= ["(Es una estanteria con luces.)"];
speakers = [id];
next_line=[-1]
}
