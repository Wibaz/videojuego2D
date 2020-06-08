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
portrait_index = 0;
voice = snd_voice1;
name = "Ezra";
if(!global.Key)
{
	text = ["(Alguien está llorando en el camarote de al lado. Debe ser la mujer de vestido rosa, creo que se llamaba Ibuki.)","¿Esta Ibuki dentro?.","Presumiblemente sí.", "Aun así, no te preocupes por ella ahora, se le pasará pronto.","Tendrías que preocuparte más por tí mismo, estas demasiado relajado. Parece que estuvieras acostumbrado a esto","No creas. Si me disculpas tengo que dejar de hablar contigo ahora mismo.","Touché."];
	speakers = [objPlayer,objPlayer,id,id,id,objPlayer,id];
	next_line=[0,0,0,0,0,0,-1];
}
else if (global.Key && !global.Puzzle2Completado)
{
	text = ["Ya tienes la llave por lo que veo.","Aun así deberías pasar de Ibuki.", "Creo que prefiero ignorar sus consejos.","(Espero que la policía llegue pronto, no aguanto a esta gente.)"];
	speakers = [id,id,objPlayer,objPlayer];
	next_line=[0,0,0,-1];
}