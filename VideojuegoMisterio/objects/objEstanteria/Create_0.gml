// Inherit the parent event
event_inherited();

//Nuevo
portrait_index = 1;
voice = snd_voice2;
name = "Reed";
//global.IbukiParla = true;
if(global.IbukiParla){
	global.HardDisk = true;
text = ["¡Has conseguido un Disco Duro!.","(Ya no saben ni donde poner las cosas.)"];
speakers = [id,id];
next_line=[0,-1]
}
else {
text= ["(Es una estanteria con luces.)"];
speakers = [id];
next_line=[-1]
}
