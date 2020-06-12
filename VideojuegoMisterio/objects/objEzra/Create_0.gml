/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

//Lo nuevo
portrait_index = 0;
voice = snd_voice1;
name = "Ezra";
if(!global.FinAnimacion)
{
	text = ["(Parece estar hablando con esa señora.)"];
	speakers = [objPlayer];
	next_line = [-1];
}
