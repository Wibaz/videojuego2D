event_inherited();

instance_create_depth(896,448,1,objInvisibleWall);
instance_create_depth(912,448,1,objInvisibleWall);

//Nuevo
portrait_index = 0;
voice = snd_voice1;
name = "Ezra";
text = ["¿Qué ocurre Reed? ¿Ya se ha cansado de deambular por todo el barco y va a esperara a la policía de una vez?",
	"Resulta que desde siempre he tendido a actuar en vez de quedarme con los brazos cruzados como usted. Aunque, por lo visto esta vez se ha cansado de ello. ¿No?", 
	"¿De que habla ahora? Si no recuerda el de las frases ingeniosas soy yo. Usted solo es un fracasado que por su codicia se encuentra en esta trampa junto a nosotros.",
	"Ezra Williams. Cuando escuché su nombre esta noche no lo recordaba, pero ese ordenador me ha refrescado la memoria. Usted es la pareja de Ibuki. ¿No es cierto?",
	"Pero hay algo que no cuadra y de eso también se percató Zero. Les ha estado chantajeando durante meses para no destapar públicamente que cuando se conocieron ella era su profesora, acabando con la carrera de ambos.",
	"Increíble... De verdad que no me creo que lo haya descubierto. Se le veía tan perdido que no lo creía capaz.",
	"Bueno, de perdidos al río. Todo lo que ha dicho es verdad. No iba a permitir que ese bastardo le hiciera daño a ella. ",
	"Y los demás igual, otros desgraciados que habían caído en la trampa de Zero. Quizás no las mejores personas, pero gente inocente de todas formas.",
	"Así que ideé este plan para asegurar que todos nos libraríamos de esta pesadilla. Y luego apareció usted.",
	"Al principio pensé que era otro más como nosotros, pero pronto me di cuenta de que no, de que Zero se había adelantado a mí.",
	"Pero aun así no pudo evitar su destino...",
	"¡Pero yo voy a evitar el suyo!",
	"Es un criminal ahora por si no se ha dado cuenta, ¿O es que quizás la ficción ha dañado su cerebro?",
	"Nah, no creo la verdad.",
	"¿Pero qué dice?",
	"Seré un escritor de ficción, pero a usted se le ha olvidado una variable muy importante.",
	"¡TACHÁN!",
	"¡¿El arma del crimen?! La tenía en el abrigo todo el rato.",
	"Mira que es inútil, normal que le despidieran de su trabajo...", 
	"Pero...¡¿Cómo?! ¡No se atreverá!", 
	"¿Qué no? Observe, esta es mi jugada maestra, la que pone punto y final a la historia."];
speakers = [id,objPlayer, id,objPlayer,objPlayer,id,id,id, id, id, id,objPlayer,objPlayer,id,objPlayer,id, id,objPlayer,id,objPlayer,id];
next_line=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1];