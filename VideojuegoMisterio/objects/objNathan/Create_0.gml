/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

myTextBox = noone;
myName = "Ezra";

myText[0] = "Hey, my name is Erza";
myText[1] = "You were given the powers of the dead.";
myText[2] = "But even that is only temporary.";
myText[3] = "When the sun rises in the morning...";
myText[4] = "I'm afraid you're going to cease to exit.";
myText[5] = "jejejeje jejejeje jejejejejejejjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj";

//Nuevo
portrait_index = 2;
voice = snd_voice3;
name = "Nathan";
if(!global.Key)
{
	text = ["No se preocupe por el cadaver, yo me encargo.","Busque a Ibuki.","Entiendo.", "Deberia estar un su cuarto. Vayase.","(Que cortante es.)"];
	speakers = [id,id,objPlayer,id,objPlayer];
	next_line=[0,0,0,0,-1];
}
else if (global.Key)
{
	text = ["¿Ya ha hablado con Ibuki?.",["Si parece que ya se encuentra mejor.","No, la verdad."], "Ya veo, ahora si me disculpa voy a seguir investigando.","Pues debería."];
	speakers = [id,objPlayer,id,id];
	next_line=[0,[2,3],-1,-1];
}