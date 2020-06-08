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

//Lo nuevo
portrait_index = 0;
voice = snd_voice1;
name = "Ezra";
text = [
	"Hey, my name is Erza. Jejeje.",
	[
		"Opción 1",
		"Texto opcion 1"
	],
	"You were given the powers of the dead.",
	"Oh papa, has elegido la opción 2......"
];
speakers = [id, objPlayer, id, id];
next_line = [0, [2, 3], -1, -1];