// Inherit the parent event
event_inherited();

//Nuevo
portrait_index = 1;
voice = snd_voice2;
name = "Reed";
//global.IbukiParla = true;
if(global.IbukiParla){
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