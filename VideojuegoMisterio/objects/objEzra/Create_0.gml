/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

instance_create_depth(928,512,1,objInvisibleWall);
instance_create_depth(912,512,1,objInvisibleWall);
instance_create_depth(928,504,1,objInvisibleWall);
instance_create_depth(912,504,1,objInvisibleWall);


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
