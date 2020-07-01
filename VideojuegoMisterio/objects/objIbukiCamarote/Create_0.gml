/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();


//Nuevo
portrait_index = 3;
voice = snd_voice2;
name = "Ibuki";
if(global.FinAnimacion)
{
text = ["(Parece afectada, si quiero hablar con ella primero tendría que calmarla.)","¿Se encuentra bien?","Entiendo que puede ser difícil, pero piense que la policía llegará cuanto antes y esto habrá acabado.", "El asesino puede seguir aquí, intente mantanerse cerca de los demas en vez de aislarse.","Supongo que tiene razón, pero no puedo.","Si descubre algo dígamelo e intentare ir.","Gracias... Imagino que debería salir del cuarto. Estaré en la cocina entonces."];
speakers = [objPlayer,objPlayer,objPlayer,objPlayer,id,objPlayer,id];
next_line=[0,0,0,0,0,0,-1];
}
else
{
	text = ["(Parace estar hablando con ese señor pero se le ve una expresion rara.)"];
	speakers = [objPlayer];
	next_line=[-1];
}

