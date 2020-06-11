switch (state) {
	case "IN_GAME": {
		draw_set_alpha(1);
		break;
	}
	case "IN_ROOM_TRANSITION_ENTER": {
		alpha -= 0.05;
		if (alpha <= 0) {
			alpha = 0;
			state = "IN_ROOM_TRANSITION_EXIT"
		}
		draw_set_alpha(alpha);
		break;
	}
	case "IN_ROOM_TRANSITION_EXIT": {
		alpha += 0.05;
		if (alpha >= 1) {
			alpha = 1;
			state = "IN_GAME"
		}
		draw_set_alpha(alpha);
		break;
	}
}
/*
switch(global.scene){
	case 0:
		objPlayer.sprite_index = sprPlayerLeft;
		objPlayer.playerMove = false;
		alarm[0] = 40;
		global.scene++;
		break;
	case 1:
		break;
	case 2:
		instance_create_layer(758, 427, "Weather", particle_rain);
		global.scene++;
		break;
	case 3:
		alarm[0] = 200;
		global.scene++;
		break;
	case 4:
		break;
	case 5:
		instance_create_depth(758, objPlayer.y, 1, objManoDerecha);
		with (objManoDerecha) {
			image_index = 1;
			hspeed = -2;
		}
		global.scene++;
		break;
	case 6:
		with(objManoDerecha){
			if(x < (objPlayer.x + 32)){
				hspeed = 0;
				text = ["Señor Reed, es mejor que pase adentro o va a echar a perder su traje. Los demás invitados ya están en la sala principal y mi señor no tardara nada en llegar. Quiere hablar con usted antes de nada.",
						"(Mmm... Está bien, esperaré allí. Más vale que esto no sea una pérdida de tiempo, no estoy aquí para bromas o fiestas.)"];
				speakers = [id,objPlayer];
				next_line=[0,-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 7:
		with(objManoDerecha){
				if (!instance_exists(activate_textbox)) {
					image_index = 3;
					hspeed = 2;
					objPlayer.sprite_index = sprPlayerRight;
					objPlayer.hspeed = 2;
					global.scene++;
				}
		}
		break;
	case 8:
		with (objManoDerecha){
			if (x > 758) {
				instance_destroy();
				global.scene++;
			}
		}
		break;
	case 9:
		if (room == Pasillo) {
			objPlayer.sprite_index = sprPlayerUp;
			instance_create_depth(objPlayer.x, objPlayer.y - 32, 1, objManoDerecha);
			with (objManoDerecha) {
				image_index = 1;
				hspeed = -2;
			}
			objPlayer.vspeed = -2;
			global.scene++;
		}
		break;
	case 10:
		if (objPlayer.y <= objManoDerecha.y){
			with (objPlayer){
				vspeed = 0;
				sprite_index = sprPlayerLeft;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 11:
		if (objManoDerecha.x <= 125) {
			with (objManoDerecha) {
				image_index = 1;
				hspeed = 0;
				image_index = 2;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	case 12:
		if (objPlayer.x <= objManoDerecha.x){
			with (objPlayer) {
				hspeed = 0;
				sprite_index = sprPlayerUp;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	case 13:
		if (objManoDerecha.y <= 45){
			with(objManoDerecha) {
				vspeed = 0;
				image_index = 1;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 14:
		if (objPlayer.y <= objManoDerecha.y){
			with(objPlayer){
				vspeed = 0;
				sprite_index = sprPlayerLeft;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 15:
		if (objManoDerecha.x <= 32){
			with(objManoDerecha) {
				instance_destroy();
			}
			global.scene++;
		}
		break;
	case 16:
		if (room == Salon){
			instance_create_depth(192, 592, 0, objNathan);
			objNathan.image_index = 3;
			instance_create_depth(816, 592, 1, objEzra);
			objEzra.image_index = 1;
			instance_create_depth(656, objTarta.y - 32, 1, objLaria);
			objLaria.image_index = 1;
			instance_create_depth(752, 592, 1, objIbukiCamarote);
			objIbukiCamarote.image_index = 2;
			
			with(objPlayer){
				hspeed = 0;
				instance_create_depth(x, y - 32, 1, objManoDerecha);
				sprite_index = sprPlayerUp;
			}
			alarm[0] = 100;
			global.scene++;
		}
		break;
	case 17:
		break;
	case 18:
		with(objManoDerecha){
			text = ["Nos vemos más tarde señor Reed. Sea paciente."];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 19:
		with(objManoDerecha){
			if (!instance_exists(activate_textbox)) {
				with(objPlayer){
					sprite_index = sprPlayerLeft;
					hspeed = -2;
				}
				global.scene++;
			}
		}
		break;
	case 20:
		if(objPlayer.x <= 881){
			with(objPlayer){
				hspeed = 0;
				sprite_index = sprPlayerRight;
			}
			objManoDerecha.vspeed = +2;
			global.scene++;
		}
		break;
	case 21:
		if (objManoDerecha.y >= objPlayer.y){
			with(objManoDerecha) {
				vspeed = 0;
				image_index = 3;
				hspeed = +2;
			}
			global.scene++;
		}
		break;
	case 22:
		if(objManoDerecha.x >= 945){
			with(objManoDerecha){
				instance_destroy();
			}
			global.scene++;
		}
		break;
	case 23:
		with(objPlayer){
			text = ["(Que tipo tan extraño.)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 24:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objEzra.image_index = 3;
				objEzra.hspeed = +2;
				global.scene++;
			}
		}
		break;
	case 25:
		if(objEzra.x >= objPlayer.x){
			with(objEzra){
				hspeed = 0;
				image_index = 2;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	case 26:
		if(objEzra.y <= objPlayer.y + 32){
			objPlayer.sprite_index = sprPlayerDown;
			with(objEzra){
				vspeed = 0;
				text = ["Hey, buenas noches. Oye, tu cara no me suena nada, ¿es la primera vez que te invitan a estas fiestas?",
						"¿Estas fiestas? ¿Es que tú ya has estado otras veces aquí?",
						"Pues sí, pero esperemos que esta sea la última. Al final se hacen pesadas y son inaguantables. Nunca pasa nada interesante sabes, yo soy partidario de lo inesperado, que las fuerzas oscuras nos den algo de entretenimiento...",
						"(¿De dónde ha salido este tipo?)",
						"Oh, por tu cara creo que no sabes quién soy. Mea culpa, la fama hace este tipo de cosas... Me llamo Ezra Williams y soy escritor de novela negra, de ahí que te haya soltado eso ja ja.",
						"Espera, ese nombre sí me suena, salió en las noticas hace poco...",
						"¡Por supuesto! Todos mis libros son best-Sellers, seguro que dijeron algo de mi última novela.",
						"Lo que tu digas... Soy Reed, por cierto. Y con eso es suficiente.",
						"Así que hombre de misterio ¿eh? Esto se pone interesante... ¿Parece que las fuerzas oscuras me han oído desde el inframundo!"];
				speakers = [id, objPlayer, id, objPlayer, id, objPlayer, id, objPlayer, id];
				next_line = [0, 0, 0, 0, 0, 0, 0, 0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
			}
			global.scene++;
		}
		break;
	case 27:
		with(objEzra){
			if (!instance_exists(activate_textbox)) {
				image_index = 0;
				objEzra.vspeed = +2;
				global.scene++;
			}
		}
		break;
	case 28:
		if (objEzra.y >= 592){
			with(objEzra){
				image_index = 1;
				vspeed = 0;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 29:
		if(objEzra.x <= 816){
			objEzra.hspeed = 0;
			with(objPlayer){
				text = ["(¿Que esperar de un escritor?, están todos locos. Pero ese nombre... ¿seguro que la noticia era sobre una novela? o... ¡Aghh maldita memoria de pez, por tu culpa estoy aquí en este barco de raritos!)",
				"(Voy a tomar un poco de tarta, a ver si mejora la cosa.)"];
				speakers = [id, id];
				next_line=[0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
			}
			global.scene++;
		}
		break;
	case 30:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objPlayer.playerMove = true;
				global.scene++;
			}
		}
		break;
	case 31:
		if ((objPlayer.x >= objTarta.x - 16) && (objPlayer.x <= objTarta.x + 16) &&
			(objPlayer.y >= objTarta.y) && (objPlayer.y <= objTarta.y + 32) &&
			keyboard_check_pressed(global.key_interact))
		{
			instance_destroy(obj_textbox);
			objPlayer.playerMove = false;
			objPlayer.speed = 0;
			objPlayer.sprite_index = sprPlayerUp;
			objTarta.sprite_index = sprTartaTerminada;
			alarm[0] = 20;
			global.scene++;
		}
		break;
	case 32:
		break;
	case 33:
		with(objLaria){
			image_index = 0;
			text = ["Lo siento tío, pero ahí has estado muy lento. Ops, espera, ¿tu quien porras eres?",
			"¡Pero, cómo! ¡¿Niña tú que haces aquí?!",
			"Uy lo siento, pensaba que era otra persona, mira tú. Pues me he comido ya el trozo de tarta, otra vez será.  Es que hay que aprovechar toda la comida sabe. En este mundo muere mucha gente de hambre y esas cosas. ¡Qué rica estaba! Por cierto, me llamo Laria, que se me olvida presentarme.",
			"Soy Reed. Deberías tratar con más respeto a la gente... Espera ¿no eres muy joven para estar en una fiesta privada en un yate de un empresario de noche?",
			"¡Hala, no me sea abuelo! Tengo 19 años, voy a la Academia de Artes, dentro de nada tendré que pagar impuestos. Oiga ¿y usted a que se dedica? Por su aspecto diría... ¡Abogado de mala muerte! ¿He acertado? ¡Diga que sí!",
			"No te voy a decir nada, me has robado la tarta.",
			"Espera ¡¿que?! Eso no es justo ¡Oigaaaa!"];
			speakers = [id, objPlayer, id, objPlayer, id, objPlayer, id];
			next_line=[0, 0, 0, 0, 0, 0, -1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 34:
		with(objLaria){
			if (!instance_exists(activate_textbox)) {
				image_index = 1;
				with(objPlayer){
					sprite_index = sprPlayerDown;
					vspeed = +2;
				}
				global.scene++;
			}
		}
		break;
	case 35:
		with(objPlayer){
			if(y >= objIbukiCamarote.y){
				vspeed = 0;
				objLaria.image_index = 1;
				sprite_index = sprPlayerRight;
				hspeed = +0.5;
				global.scene++;
			}
		}
		alarm[0] = 20;
		break;
	case 36:
		break;
	case 37:
		with(objPlayer){
			text = ["(Una cría de la Academia de Artes, lo que faltaba... ¿Quiénes somos los del barco? ¿Porque estamos aquí? ¿Ellos han venido por la misma carta que recibí? ¿Y eso de que haya habido otras fiestas que significa?)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 38:
		with(objPlayer){
			if (x >= objIbukiCamarote.x - 64){
				hspeed = 0;
			}
			if (!instance_exists(activate_textbox)) {
				hspeed = +0.5;
				with(objIbukiCamarote){
					image_index = 1;
					hspeed = -2;
				}
				global.scene++;
			}
		}
		break;
	case 39:
		with(objIbukiCamarote){
			if (x <= 720) {
				hspeed = 0;
				image_index = 3;
				global.scene++;
			}
		}
		break;
	case 40:
		with(objPlayer){
			if (x >= 690){
				hspeed = 0;
				x -= 15;
				objIbukiCamarote.y += 15;
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 41:
		break;
	case 42:
		with(objEzra){
			text = ["..."];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 43:
		with(objEzra){
			if (!instance_exists(activate_textbox)) {
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 44:
		break;
	case 45:
		with(objIbukiCamarote){
			text = ["¡Ay! ¡Mi pie!",
					"¡Oh! Lo siento mucho, no era mi intención... Ehh... Soy Reed, buenas noches señorita...",
					"Takemi, Ibuki Takemi. Uhh... ¿Usted no...? ¡Ahh!",
					"Está temblando, ¿Se encuentra bie--?",
					"¡Le ruego que me disculpe!"];
			speakers = [id, objPlayer, id, objPlayer, id];
			next_line=[0, 0, 0, 0, -1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 46:
		with(objIbukiCamarote){
			if (!instance_exists(activate_textbox)) {
				vspeed = -4;
				global.scene++;
			}
		}
		break;
	case 47:
		with(objIbukiCamarote){
			if (y <= objLaria.y){
				vspeed = 0;
				image_index = 2;
				hspeed = 4;
				global.scene++;
			}
		}
		break;
	case 48:
		if (objIbukiCamarote.x >= 945) {
			with(objIbukiCamarote){
				instance_destroy();
			}
			with(objPlayer){
				text = ["(Vaya, para una persona medianamente normal del barco acabo espantándola... Ya solo queda, el hombre que lleva en el rincón desde que he entrado. Se parece a mí un poco, quizás él puede decirme algo sobre lo que está pasando o al menos tener una conversación racional.)"];
				speakers = [id];
				next_line=[-1];
				activate_textbox = create_textbox(text, speakers, next_line);
			}
			global.scene++;
		}
		break;
	case 49:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				playerMove = true;
				global.scene++;
			}
		}
		break;
	case 50:
		if ((objPlayer.x >= objNathan.x - 16) && (objPlayer.x <= objNathan.x + 16) &&
			(objPlayer.y >= objNathan.y - 64) && (objPlayer.y <= objNathan.y) &&
			keyboard_check_pressed(global.key_interact))
		{
			with(objPlayer){
				playerMove = false;
				speed = 0;
				sprite_index = sprPlayerDown;
			}
			with(objNathan){
				text = ["Buenas noches, me llamo Reed, ¿podría decirme si sabe que va a ocurrir cuando llegue el anfitrión?",
						"...",
						"(¿Qué le pasa? ¿He dicho algo malo? ¿Y esa mueca? Mierda, no entiendo qué clase de gente está en esta fiesta.)",
						"¿Cómo se llama uste--?"];
				speakers = [objPlayer, id, objPlayer, objPlayer];
				next_line=[0, 0, 0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
			}
			global.scene++;
		}
		break;
	case 51:
		with(objNathan){
			if (!instance_exists(activate_textbox)) {
				instance_create_depth(945, 528, 1, objCharles);
				objCharles.image_index=0;
				objCharles.sprite_index=sprCharlesLeft;
				objCharles.image_speed=3;
				objCharles.hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 52:
		with(objCharles){
			if(x <= objEzra.x){
				hspeed = 0;
				text = ["¡Pero bueno! Habéis venido todos, que bien, que bien JA JA. Incluso el señor Reed, de quien yo dudaba el que más.",
						"Zero..."];
				speakers = [id, objPlayer];
				next_line=[0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 53:
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				objPlayer.sprite_index = sprPlayerRight;
				objEzra.image_index = 2;
				objLaria.image_index = 3;
				objCharles.hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 54:
		with(objCharles){
			if (x <= objLaria.x + 32){
				hspeed = 0;
				sprite_index = sprCharlesDown;
				vspeed = +1;
				global.scene++;
			}
		}
		break;
	case 55:
		with(objCharles){
			if (y >= objEzra.y){
				vspeed = 0;
				objLaria.image_index = 0;
				objEzra.image_index = 1;
				sprite_index = sprCharlesLeft;
				hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 56:
		with(objCharles){
			if (x <= objTarta.x){
				hspeed = 0;
				text = ["¡Ese soy yo! Tengo que hablar contigo amigo mío, antes de que comience la fiesta. Aunque a juzgar por los trozos de tarta que quedan parece que la fiesta ya ha empezado ¿no, Laria?"];
				speakers = [id];
				next_line=[-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 57:
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				objCharles.sprite_index = sprCharlesUp;
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 58:
		break;
	case 59:
		objLaria.image_index = 2;
		objGame.alarm[0] = 20;
		global.scene++;
		break;
	case 60:
		break;
	case 61:
		with(objPlayer){
			text = ["(La cara de la chica ha cambiado en un momento.)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 62:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objCharles.sprite_index = sprCharlesLeft;
				objCharles.hspeed = -1.5;
				global.scene++;
			}
		}
		break;
	case 63:
		with (objCharles){
			if (x <= 448){
				hspeed = 0;
				text = ["Pues si me acompaña a esta mesa señor Reed, podremos discutir el asunto que lo atañe. Acérquese, acérques---"];
				speakers = [id];
				next_line=[-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 64:
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				instance_create_layer(0, 0, "Luz", o_surface_Light);
				o_surface_Light.claridad = 1;
				text = ["Eh... ¿Y las luces?",
						"¡AHHHHH! ¡¿QUÉ ESTÁ PASANDO?! ¡NO VEO NADA!",
						"¡ESPERA! ¿un apagón? ¡Ja ja esto se pone interesante! La caja de control estaba a la entrada ¿no? Voy a ver si lo arreglo...",
						"Hmm-",
						"¿QUÉ? ¡¿QUÉ ES ESTO?! ¡¡NO, NO, NOOOO!! ¡DETENGASE AHORA MISMO!",
						"Señor Zero tranquilícese, solo es un apagón, Williams ahora lo arr--"];
				speakers = [id, objLaria, objEzra, objNathan, objCharles, id];
				next_line=[0, 0, 0, 0, 0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 65:
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				with(objNathan){
					x = 288;
					y = 608;
					image_index = 1;
				}
				with(objEzra){
					x = 912;
					y = 480;
					image_index = 0;
				}
				with(objLaria){
					image_index = 1;
				}
				with(objCharles){
					image_index = 2;
				}
				audio_play_sound(sndDisparo, 1, false);
				objGame.alarm[0] = 120;
				global.scene++;
			}
		}
		break;
	case 66:
		break;
	case 67:
		instance_destroy(o_surface_Light);
		alarm[0] = 40;
		global.scene++;
		break;
	case 68:
		break;
	case 69:
		with (objPlayer){
			text = ["¡¡AAAAAAAAAAAAAAHHHHHHHH!! ¡¡ESTÁ MUERTO!! ¡¿QUÉHA PASADO?!",
					"¡¿Qué?! ¡No puede ser! Esto es... una tragedia... ¿QUIÉN HA SIDO?",
					"Dios...",
					"¡¿CÓMO?!",
					"EL OTRO HOMBRE, YA NO ESTÁ. Ha tenido que ser él, y ahora ha huido por la borda... ¡O QUIZAS SIGUE AQUÍ! ¡Noooooo, no quiero morir!",
					"Oye, tranquilízate, si nos quisiera haber matado ya lo hubiera hecho. Lo mejor es que nos calmemos todos, llamemos a la guardia costera y cuando lleguen les expliquemos lo ocurrido. No pasa nada.",
					"Muy tranquilo estas tú..."];
			speakers = [objLaria, objEzra, objNathan, id, objLaria, objEzra, objNathan];
			next_line=[0, 0, 0, 0, 0, 0, -1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 70:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 71:
		break;
	case 72:
		with (objNathan) {
			image_index = 3;
			hspeed = +2;
		}
		global.scene++;
		break;
	case 73:
		with(objNathan){
			if(x >= objTarta.x + 64){
				hspeed = 0;
				image_index = 2;
				vspeed = -2;
				global.scene++;
			}
		}
		break;
	case 74:
		with(objNathan){
			if(y <= objTarta.y - 32){
				vspeed = 0;
				image_index = 3;
				hspeed = 2;
				global.scene++;
			}
		}
		break;
	case 75:
		with(objNathan){
			if(x >= 945){
				instance_destroy();
				global.scene++;
			}
		}
		break;
	case 76:
		with (objPlayer){
			text = ["No me esperaba que esto terminase así, pero llegué a este barco para hacer mi trabajo y eso haré. INVESTIGAR ESTE ASESINATO"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 77:
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				playerMove = true;
				global.scene++;
				global.FinAnimacion=true;
				objCharles.text=["No me creo que este muerto."]
				objCharles.speakers=[objPlayer]
				objCharles.next_line=[-1]
			}
		}
		break;
}