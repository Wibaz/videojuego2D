/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();
if(global.DestruirFinAnimacion)
	instance_destroy();
if(global.FinAnimacion && !textoCreado)
{
	text = ["¿No va a ir a por Ibuki? Habría que comentarle lo ocurrido.","Sí ya me encargo yo, tu no necesitas intervenir."];
	speakers = [objPlayer,id];
	next_line = [0,-1];
	textoCreado=false;
}


