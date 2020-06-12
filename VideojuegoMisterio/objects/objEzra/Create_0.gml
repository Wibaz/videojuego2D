/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

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