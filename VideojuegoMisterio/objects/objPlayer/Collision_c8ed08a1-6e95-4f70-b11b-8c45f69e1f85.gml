switch(global.scene){
	case 0:
		sprite_index = sprPlayerLeft;
		playerMove = false;
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
		instance_create_depth(758, 347, 1, objManoDerecha);
		global.scene++;
		break
	case 6:
		objManoDerecha.hspeed = -2;
		global.scene++;
		break;
	case 7:
		with(objManoDerecha){
			if(x < 190){
				hspeed = 0;
				text = ["Señor Reed, es mejor que pase adentro o va a echar a perder su traje. Los demás invitados ya están en la sala principal y mi señor no tardara nada en llegar. Quiere hablar con usted antes de nada.","Mmm... Está bien, esperaré allí. Más vale que esto no sea una pérdida de tiempo, no estoy aquí para bromas o fiestas."];
				speakers = [id,objPlayer];
				next_line=[0,-1];
				activate_textbox = create_textbox(text, speakers, next_line);
				global.scene++;
			}
		}
		break;
	case 8:
		with(objManoDerecha){
				if (!instance_exists(activate_textbox)) {
					objPlayer.playerMove = true;
				}
		}
		break;
}