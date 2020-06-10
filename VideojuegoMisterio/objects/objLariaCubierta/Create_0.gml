event_inherited();

myTextBox = noone;
myName = "Laria";

myText[0] = "Hola, soy Laria";
myText[1] = "Ey di algo jugador";

//Nuevo
portrait_index = 4;
voice = snd_voice3;
name = "Laria";
if(!global.Key)
{
	text = ["Por lo que veo, usted también ha llegado a la misma conclusión.","¿Por qué lo dices?", "¡Oh! Le creía más inteligente, pero parece que me había equivocado.","Si me disculpa, voy a seguir buscando."];
	speakers = [id,objPlayer,id, id];
	next_line=[0,0,0,-1];
}
else if (global.Key && !global.IbukiParla)
{
	text = ["Así que ahí estaba la llave","Le felicito por encontrarla", "Gracias... Supongo.","Me voy adelantando al cuarto de Ibuki."];
	speakers = [id,id,objPlayer, objPlayer];
	next_line=[0,0,0,-1];
}
else if (global.IbukiParla && !global.Puzzle2Completado)
{
	text = ["Por lo que veo ya ha hablado con Ibuki.", "Si, ya se encuentra mejor.","A todo esto no sabra donde encontrar piezas de ordenador.","¿Piezas de ordenador? ¿A que se debe esa necesidad?.","En el cuarto donde se encerro Ibuki habia un ordenador roto, creo que puede servirme de ayuda.","Por desgracia no tengo mucha idea de donde encontrar esas piezas, pruebe con los camarotes."];
	speakers = [id,objPlayer,objPlayer,id,objPlayer,id];
	next_line=[0,0,0,0,0,-1];
}