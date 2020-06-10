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
text = ["¡Has conseguido una placa base!.","(¿Que hacia una placa base aqui?)"];
speakers = [id,id];
next_line=[0,-1]
}else{
text = ["(La basura esta llena hasta arriba.)"];
speakers = [id];
next_line=[-1]
}