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
		if (objManoDerecha.x <= 93){
			with(objManoDerecha) {
				instance_destroy();
			}
			global.scene++;
		}
		break;
	case 16:
		if (room == Salon){
			instance_create_depth(816, 592, 1, objEzra);
			instance_create_depth(656, 448, 1, objLaria);
			objEzra.image_index = 1;
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
		if (objPlayer.x <= objLaria.x + 32){
			objPlayer.playerMove = false;
			objPlayer.x = objLaria.x + 32;
			objLaria.vspeed = +4;
			global.scene++;
		}
		break;
	case 32:
		if (objTarta.y - 32 <= objLaria.y){
			with(objLaria){
				vspeed = 0;
				image_index = 1;
			}
			objTarta.sprite_index = sprTartaTerminada;
			global.scene++;
		}
		break;
	case 33:
		if(objPlayer.y != objLaria.y){
			if(
		}
		global.scene++;
		break;
	case 33:
		with(objLaria){
			image_index = 3;
			text = ["Lo siento tío, pero ahí has estado muy lento. Ops, espera, ¿tu quien porras eres?",
			"¡Pero, cómo! ¡¿Niña tú que haces aquí?!",
			"Uy lo siento, pensaba que era otra persona, mira tú. Pues me he comido ya el trozo de tarta, otra vez será.  Es que hay que aprovechar toda la comida sabe. En este mundo muere mucha gente de hambre y esas cosas. ¡Qué rica estaba! Por cierto, me llamo Laria, que se me olvida presentarme.",
			"Soy Reed. Deberías tratar con más respeto a la gente... Espera ¿no eres muy joven para estar en una fiesta privada en un yate de un empresario de noche?",
			"¡Hala, no me sea abuelo! Tengo 19 años, voy a la Academia de Artes, dentro de nada tendré que pagar impuestos. Oiga ¿y usted a que se dedica? Por su aspecto diría... ¡Abogado de mala muerte! ¿He acertado? ¡Diga que sí!",
			"No te voy a decir nada, me has robado la tarta.",
			"Espera ¡¿que?! Eso no es justo ¡Oigaaaa!"];
			speakers = [id, objPlayer, id, objPlayer, id, objPlayer, id];
			next_line=[0, -1];
			activate_textbox = create_textbox(text, speakers, next_line);
		}
		global.scene++;
		break;
	case 34:
		with(objLaria){
			if (!instance_exists(activate_textbox)) {
				objPlayer. playerMove = true;
				global.scene++;
			}
		}
		break;
}
