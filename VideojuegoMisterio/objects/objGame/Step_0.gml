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

switch(global.scene){
	#region Cubierta
	case 0: // Deja el sprite del jugador mirando a la izquierda
		objPlayer.sprite_index = sprPlayerIddleLeft;
		objPlayer.playerMove = false;
		alarm[0] = 40;
		global.scene++;
		break;
	case 1:
		break;
	case 2: // Crear la lluvia
		instance_create_layer(758, 427, "Weather", particle_rain);
		global.scene++;
		break;
	case 3: // Tiempo hasta que se cree objManoDerecha
		alarm[0] = 200;
		global.scene++;
		break;
	case 4:
		break;
	case 5: // Creación y velocidad de objManoDereceha
		instance_create_depth(758, objPlayer.y, 1, objManoDerecha);
		with (objManoDerecha) {
			sprite_index = sprManoDchaLeft;
			hspeed = -2;
		}
		global.scene++;
		break;
	case 6: // Diálogo objManoDerecha cubierta
		with(objManoDerecha){
			if(x < (objPlayer.x + 32)){
				sprite_index = sprManoDchaIdleLeft;
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
	case 7: // Termina el diálogo de objManoDerecha 
		with(objManoDerecha){
				if (!instance_exists(activate_textbox)) {
					sprite_index = sprManoDchaRight
					hspeed = 2;
					objPlayer.sprite_index = sprPlayerRight;
					objPlayer.hspeed = 2;
					global.scene++;
				}
		}
		break;
	case 8: // objManoDerecha sale de la escena
		with (objManoDerecha){
			if (x > 758) {
				instance_destroy();
				global.scene++;
			}
		}
		break;
	#endregion
	#region Pasillo
	#region Hasta 1º esquina
	case 9: // Entra al pasillo, objManoDerecha se mueve a la izquierda y objPlayer se mueve hacia arriba
		if (room == Pasillo) {
			objPlayer.sprite_index = sprPlayerUp;
			instance_create_depth(objPlayer.x, objPlayer.y - 32, 1, objManoDerecha);
			with (objManoDerecha) {
				sprite_index = sprManoDchaLeft;
				hspeed = -2;
			}
			objPlayer.vspeed = -2;
			global.scene++;
		}
		break;
	case 10: // objPlayer se mueve hacia a la izquierda
		if (objPlayer.y <= objManoDerecha.y){
			with (objPlayer){
				vspeed = 0;
				sprite_index = sprPlayerLeft;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	#endregion
	#region Hasta 2º esquina
	case 11: // objManoDerecha se mueve hacia arriba
		if (objManoDerecha.x <= 125) {
			with (objManoDerecha) {
				sprite_index = sprManoDchaUp;
				hspeed = 0;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	case 12: // objPlayer se mueve hacia arriba
		if (objPlayer.x <= objManoDerecha.x){
			with (objPlayer) {
				hspeed = 0;
				sprite_index = sprPlayerUp;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	#endregion
	#region Hasta 3º esquina
	case 13: // objManoDerecha se mueve a la izquirda
		if (objManoDerecha.y <= 45){
			with(objManoDerecha) {
				vspeed = 0;
				sprite_index = sprManoDchaLeft
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 14: // objPlayer se mueve a la izquierda
		if (objPlayer.y <= objManoDerecha.y){
			with(objPlayer){
				vspeed = 0;
				sprite_index = sprPlayerLeft;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	#endregion
	case 15: // objManoDerecha sale de la escena
		if (objManoDerecha.x <= 32){
			with(objManoDerecha) {
				instance_destroy();
			}
			global.scene++;
		}
		break;
	#endregion
	#region Salon
	case 16: // Creacion de las instancias
		if (room == Salon){
			instance_create_depth(192, 592, 0, objNathan);
			objNathan.sprite_index = sprNathanIdleRight;
			instance_create_depth(816, 592, 1, objEzra);
			objEzra.sprite_index = sprEzraIdleLeft;
			instance_create_depth(656, objTarta.y - 32, 1, objLaria);
			objLaria.sprite_index = sprLariaIdleLeft;
			instance_create_depth(752, 592, 1, objIbukiCamarote);
			objIbukiCamarote.sprite_index = sprIbukiIdleRight;
			
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
	case 18: // 2º Diálogo objManoDerecha
		with(objManoDerecha){
			text = ["Nos vemos más tarde señor Reed. Sea paciente."];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 19: // objPlayer se mueve a la izquierda para hacer espacio a objManoDerecha
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
	case 20: // objPlayer mira a la izquierda mientras pasa objManoDerecha
		if(objPlayer.x <= 881){
			with(objPlayer){
				hspeed = 0;
				sprite_index = sprPlayerIddleRight;
			}
			objManoDerecha.vspeed = +2;
			global.scene++;
		}
		break;
	case 21: // objManoDerecha se va a ir de la sala
		if (objManoDerecha.y >= objPlayer.y){
			with(objManoDerecha) {
				vspeed = 0;
				sprite_index = sprManoDchaRight;
				hspeed = +2;
			}
			global.scene++;
		}
		break;
	case 22: // objManoDerecha sale de la escena
		if(objManoDerecha.x >= 945){
			with(objManoDerecha){
				instance_destroy();
			}
			global.scene++;
		}
		break;
	case 23: // 1º Dialgo objPlayer
		with(objPlayer){
			text = ["(Que tipo tan extraño.)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 24: // objEzra se mueve horizontalmente a objPlayer
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objEzra.sprite_index = sprEzraRight;
				objEzra.hspeed = +2;
				global.scene++;
			}
		}
		break;
	case 25: // objEzra se mueve verticalmente a objPlayer
		if(objEzra.x >= objPlayer.x){
			with(objEzra){
				hspeed = 0;
				sprite_index = sprEzraUp;
				vspeed = -2;
			}
			global.scene++;
		}
		break;
	case 26: // objEzra habla con objPlayer
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
	case 27: // objEzra vuelve a su asiento vericalmente
		with(objEzra){
			if (!instance_exists(activate_textbox)) {
				sprite_index = sprEzraDown;
				vspeed = +2;
				global.scene++;
			}
		}
		break;
	case 28: // objEzra vuelve a su asiento horizontalmente
		if (objEzra.y >= 592){
			with(objEzra){
				vspeed = 0;
				sprite_index = sprEzraLeft;
				hspeed = -2;
			}
			global.scene++;
		}
		break;
	case 29: // objEzra ha vuelto a su asiento
		if(objEzra.x <= 816){
			objEzra.hspeed = 0;
			objEzra.sprite_index = sprEzraIdleLeft;
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
	case 30: // objPlayer se puede mover
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objPlayer.playerMove = true;
				global.scene++;
			}
		}
		break;
	case 31: // objPlayer va a tomar tarta
		if ((objPlayer.x >= objTarta.x - 16) && (objPlayer.x <= objTarta.x + 16) &&
			(objPlayer.y >= objTarta.y) && (objPlayer.y <= objTarta.y + 32) &&
			keyboard_check_pressed(global.key_interact))
		{
			instance_destroy(obj_textbox);
			objPlayer.playerMove = false;
			objPlayer.speed = 0;
			objPlayer.sprite_index = sprPlayerIddleUp;
			objTarta.sprite_index = sprTartaTerminada;
			alarm[0] = 20;
			global.scene++;
		}
		break;
	case 32:
		break;
	case 33: // 1º Dialogo objLaira
		with(objLaria){
			sprite_index = sprLariaIdleDown;
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
	case 34: // objPlayer huye de objLaira
		with(objLaria){
			if (!instance_exists(activate_textbox)) {
				with(objPlayer){
					sprite_index = sprPlayerDown;
					vspeed = +2;
				}
				global.scene++;
			}
		}
		break;
	case 35: // objPlayer va hacia la derecha
		with(objPlayer){
			if(y >= objIbukiCamarote.y){
				vspeed = 0;
				objLaria.sprite_index = sprLariaIdleLeft;
				sprite_index = sprPlayerRight;
				hspeed = +0.5;
				global.scene++;
			}
		}
		alarm[0] = 20;
		break;
	case 36:
		break;
	case 37: // Dialogo fuera de Laira
		with(objPlayer){
			text = ["(Una cría de la Academia de Artes, lo que faltaba... ¿Quiénes somos los del barco? ¿Porque estamos aquí? ¿Ellos han venido por la misma carta que recibí? ¿Y eso de que haya habido otras fiestas que significa?)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			hspeed = 2;
		}
		global.scene++;
		break;
	case 38: // Choque con Ibuki
		with(objPlayer){
			if (x >= objIbukiCamarote.x - 64){
				hspeed = 0;
			}
			if (!instance_exists(activate_textbox)) {
				hspeed = +0.5;
				with(objIbukiCamarote){
					sprite_index = sprIbukiLeft;
					hspeed = -2;
				}
				global.scene++;
			}
		}
		break;
	case 39: // Ibuki yendo para arriba para chocarse
		with(objIbukiCamarote){
			if (x <= 720) {
				hspeed = 0;
				sprite_index = sprIbukiUp;
				global.scene++;
			}
		}
		break;
	case 40: // Se chocan objIbuki y objPlayer
		with(objPlayer){
			if (x >= 690){
				hspeed = 0;
				sprite_index = sprPlayerIddleRight;
				x -= 15;
				objIbukiCamarote.sprite_index = sprIbukiIdleUp;
				objIbukiCamarote.y += 15;
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 41:
		break;
	case 42: // Mirada de Ezra
		with(objEzra){
			text = ["..."];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 43: // Añadir tiempo
		with(objEzra){
			if (!instance_exists(activate_textbox)) {
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 44:
		break;
	case 45: // 1º Diaalogo de Ibuki
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
	case 46: // objIbuki sale para arriba con mucha velocidad
		with(objIbukiCamarote){
			if (!instance_exists(activate_textbox)) {
				sprite_index = sprIbukiUp;
				vspeed = -4;
				global.scene++;
			}
		}
		break;
	case 47: // objIbuki se dirige a la salida que esta a la derecha
		with(objIbukiCamarote){
			if (y <= objLaria.y){
				vspeed = 0;
				sprite_index = sprIbukiRight;
				hspeed = 4;
				global.scene++;
			}
		}
		break;
	case 48: // objIbuki sale de la habitación
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
	case 49: // El objPlayer se mueve
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				playerMove = true;
				global.scene++;
			}
		}
		break;
	case 50: // 1º Dialogo con Nathan
		if ((objPlayer.x >= objNathan.x - 16) && (objPlayer.x <= objNathan.x + 16) &&
			(objPlayer.y >= objNathan.y - 64) && (objPlayer.y <= objNathan.y) &&
			keyboard_check_pressed(global.key_interact))
		{
			with(objPlayer){
				playerMove = false;
				speed = 0;
				sprite_index = sprPlayerIddleDown;
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
	case 51: // Entra objCharles a la escena
		with(objNathan){
			if (!instance_exists(activate_textbox)) {
				instance_create_depth(945, 528, 1, objCharles);
				objCharles.sprite_index = sprCharlesLeft;
				objCharles.hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 52: // 1º Dialpgo objCharles
		with(objCharles){
			if(x <= objEzra.x){
				sprite_index = sprCharlesIdleLeft;
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
	case 53: // Cambio de escena de los personajes
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				objPlayer.sprite_index = sprPlayerIddleRight;
				objEzra.image_index = sprEzraIdleUp;
				objLaria.sprite_index = sprLariaIdleRight;
				objCharles.sprite_index = sprCharlesLeft;
				objCharles.hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 54: // objCharles se acerca a objLaira
		with(objCharles){
			if (x <= objLaria.x + 32){
				hspeed = 0;
				sprite_index = sprCharlesDown;
				vspeed = +1;
				global.scene++;
			}
		}
		break;
	case 55: // objCharles ha llegado a segunda esquina
		with(objCharles){
			if (y >= objEzra.y){
				vspeed = 0;
				objLaria.sprite_index = sprLariaIdleDown;
				objEzra.sprite_index = sprEzraIdleLeft;
				sprite_index = sprCharlesLeft;
				hspeed = -1;
				global.scene++;
			}
		}
		break;
	case 56: // objCharles llega a la posicion a objLaira
		with(objCharles){
			if (x <= objTarta.x){
				sprite_index = sprCharlesIdleLeft;
				hspeed = 0;
				text = ["¡Ese soy yo! Tengo que hablar contigo amigo mío, antes de que comience la fiesta. Aunque a juzgar por los trozos de tarta que quedan parece que la fiesta ya ha empezado ¿no, Laria?"];
				speakers = [id];
				next_line=[-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 57: // objCharles mira a objLaira
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				objCharles.sprite_index = sprCharlesIdleUp;
				objGame.alarm[0] = 20;
				global.scene++;
			}
		}
		break;
	case 58:
		break;
	case 59: // objLaira aparta la mirada de objCharles
		objLaria.sprite_index = sprLariaIdleUp;
		objGame.alarm[0] = 20;
		global.scene++;
		break;
	case 60:
		break;
	case 61: // habla objPlayer
		with(objPlayer){
			text = ["(La cara de la chica ha cambiado en un momento.)"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 62: // objCharles se va a la segunda mesaa a la izquierda
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				objCharles.sprite_index = sprCharlesLeft;
				objCharles.hspeed = -1.5;
				global.scene++;
			}
		}
		break;
	case 63: // objCharles llega a la segunda mesa
		with (objCharles){
			if (x <= 448){
				sprite_index = sprCharlesIdleLeft;
				hspeed = 0;
				text = ["Pues si me acompaña a esta mesa señor Reed, podremos discutir el asunto que lo atañe. Acérquese, acérques---"];
				speakers = [id];
				next_line=[-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 64: // Cuando termina el diálogo se apaga la luz de la escena
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
				speakers = [id, objLaria, objEzra, objNathan, objCharles, objPlayer];
				next_line=[0, 0, 0, 0, 0, -1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 65: // Cambio de sitio de los sprites
		with(objCharles){
			if (!instance_exists(activate_textbox)) {
				with(objNathan){
					visible = false;
					x = 288;
					y = 608;
					sprite_index = sprNathanIdleLeft;
				}
				with(objEzra){
					visible = false;
					x = 912;
					y = 480;
					sprite_index = sprEzraIdleDown;
				}
				with(objCharles){
					visible = false;
					sprite_index = sprCharlesIdleUp;
				}
				with(objLaria){
					visible = false;
					sprite_index = sprLariaIdleLeft;
				}
				with (objPlayer) {
					visible = false;
				}
				audio_play_sound(sndDisparo, 1, false);
				objGame.alarm[0] = 120;
				global.scene++;
			}
		}
		break;
	case 66:
		break;
	case 67: // Retardo para ver la escena cuando 
		instance_destroy(o_surface_Light);
		objNathan.visible = true;
		objEzra.visible = true;
		objEzra.visible = true;
		objCharles.visible = true;
		instance_create_depth(objCharles.x+32,objCharles.y,depth,objBlood);
		objPlayer.visible = true;
		objLaria.visible=true;
		alarm[0] = 40;
		global.scene++;
		break;
	case 68:
		break;
	case 69: // Diálogos despues de ver la muerte
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
	case 72: // Nathan va hacia el cuerpo muerto
		with (objNathan) {
			sprite_index = sprNathanRight;
			hspeed = +2;
		}
		global.scene++;
		break;
	case 73: // objNathan se para horizontalmente delante del cadaver
		with(objNathan){
			if(x >= objCharles.x){
				hspeed = 0;
				sprite_index = sprNathanIdleUp;
				vspeed = -2;
				global.scene++;
			}
		}
		break;
	case 74: // objNathan se para delante verticalmente del cadaver
		with(objNathan){
			if (y <= objCharles.y){
				vspeed = 0;
				sprite_index = sprNathanIdleUp;
				global.scene++;
			}
		}
		break;
	case 75: // Ultimo dialogo anyes de moverse de objPlayer
		with (objPlayer){
			text = ["No me esperaba que esto terminase así, pero llegué a este barco para hacer mi trabajo y eso haré. INVESTIGAR ESTE ASESINATO"];
			speakers = [id];
			next_line=[-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			global.scene++;
		}
		break;
	case 76: // objPlayer se mueve
		with(objPlayer){
			if (!instance_exists(activate_textbox)) {
				global.scene++;
				global.FinAnimacion=true;
				objCharles.text=["No me creo que este muerto."]
				objCharles.speakers=[objPlayer]
				objCharles.next_line=[-1]
				playerMove = true;
			}
		}
		break;
	#endregion
}

switch(global.scene2){
	case 0:
		break;
	case 1:
	with(objPlayer){
		playerMove=false;
		vspeed=2;
		sprite_index = sprPlayerDown;
		global.scene2++;
		}
		break;
	case 2:
		with(objPlayer){
			if(y >=160){
				vspeed = 0;
				image_index=0;
				global.scene2++;
			}
		}
		break;
	
	case 3:
		with (objPlayer){
			{
			playerMove = false;
			text = ["El ordenador contiene varios archivos irrelevantes pero este me llama la atención.",
			"Descripción de los invitados. Tiene informacion de cada uno de los invitados de esta fiesta.",
			"Nathan Ring: Un tipo fuerte con cara de pocos amigos que para defender a su hermano de las peleas callejeras en las que se metía acabo dejando en coma a un policía.", 
			"Por ello sufre chantaje de Zero.",
			"Laria Deystar: Una joven y enérgica estudiante de arte con un pasado de pobreza.",
			"Para lograr su sueño de estudiar en la prestigiosa Academia de Arte tuvo que pedir dinero a Zero y al devolverlo este le sumo unos intereses desorbitados a los que ella nunca podrá hacer frente.",
			"Ibuki Takemi: Una profesora de literatura de universidad de origen japonés y mirada apagada.", 
			"Durante una temporada de su vida vivió con miedo a perder su trabajo debido a los rumores de su romance con uno de sus alumnos, hasta que un día pago a Zero para que silenciase todos.",
			"Ezra Williams: Un joven y famoso escritor de novela negra de mente retorcida.", 
			"En el 2005 fue acusado de cometer una serie de asesinatos pero quedo impugne, en 2013 volvieron acusarle pero no consiguieron suficientes pintas.",
			"Pareja de Ibuki. Es el mas peligroso de todos.",
			"Wax Reed: Antiguo policia el cual fue acusado por un crimen, decidio retirarse en vez de manchar su honor como oficial.",
			"Me servira como protección ante los invitado.",
			"Todos tenian deudas con Charlse Zero, iamgino que los invito para resolverlas pero por desgracia le salio mal la jugada.",
			"Seguramente alguno de ellos decidio matarlo, que mas dudas me genera es Ezra debería intentar sacarle información."];
			speakers = [id,id,id,id,id,id,id,id,id,id,id,id,id,id,id];
			next_line=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1];
			activate_textbox = create_textbox(text, speakers, next_line);
			}		
		}
		global.scene2++;
		break;
	case 4:
		if(!instance_exists(objPlayer.activate_textbox)){
			objPlayer.playerMove = true;
			global.scene2++;
		}
		break;
	case 5:
		break;
}
switch(global.scene3){
	case 0: // objPlayer va a tomar tarta
		with(objEzraSalon) {
			if ((objPlayer.x >= x - 16) && (objPlayer.x <= x + 16) &&
				(objPlayer.y >= y) && (objPlayer.y <= y + 64) &&
				keyboard_check_pressed(global.key_interact))
			{
				instance_destroy(obj_textbox);
				objPlayer.playerMove = false;
				global.scene3++;
			}
		}
	break;
case 1: // 1º Dialogo objLaira
	with(objEzraSalon){
		activate_textbox = create_textbox(text, speakers, next_line);
	}
	global.scene3++;
	break;
case 2:
	with (objEzraSalon) {
		if (!instance_exists(activate_textbox)) {
			objPlayer.visible = false;
			instance_destroy(objCharles)
			objEzraSalon.visible = false;
			instance_destroy(objEzraSalon);
			objCapitan.visible = false;
			objBlood.visible = false;
			objTarta.visible = false;
			instance_create_depth(0,0, 1000, objEscenaFinal);
			global.scene3++;
			
		}
	}
	break;
case 3:
	if (o_surface_Light.claridad == 1) {
		objEscenaFinal.primeraEscena = false;
		instance_destroy(o_surface_Light);
		objEscenaFinal.sprite_index = sprFondoPortada;
		alarm[1] = 120;
		global.scene3++;
	}
	break;
case 4:
	break;
case 5:
	game_end();
	break;
}