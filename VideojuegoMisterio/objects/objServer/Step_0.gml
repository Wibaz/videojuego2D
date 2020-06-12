/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(!global.HardDisk || !global.PlacaBase || !global.FuenteDeAlimentacion)
{
	//Lo nuevo
	portrait_index = 1;
	voice = snd_voice2;
	name = "Reed";
	text = ["Parece ser una caja de ordenador, pero no funciona le faltan piezas."];
	speakers = [id];
	next_line = [-1];
}
else if(global.serverOkay)
{
	portrait_index = 1;
	voice = snd_voice2;
	name = "Reed";
	text = ["Todo parece en orden por aqui mejor miro el ordenador."];
	speakers = [id];
	next_line = [-1];
}
else
{
	portrait_index = 1;
	voice = snd_voice2;
	name = "Reed";
	text = ["Vamos a arreglar el ordenador."];
	speakers = [id];
	next_line = [-1];
}
// Inherit the parent event
event_inherited();

