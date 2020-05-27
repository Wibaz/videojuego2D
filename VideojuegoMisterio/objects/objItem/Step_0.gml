if(drop_move){
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if( abs(x - goal_x) < 1 and abs(y - goal_y) < 1) { drop_move = false; }
} else {
	if(!keyboard_check(ord("O"))) exit;
	var px = objPlayer.x;
	var py = objPlayer.y;
	var r = 32;
	
	if(point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
		
		//¿Estamos encima del jugador?
		r = 2;
		if(! point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
			//Se mueve hacia el jugador para ser cogido
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		} else { //Coge el item
			var in = item_num;
			
			with(objInventario){
				var ds_inv		= ds_inventario;
				var picked_up	= false;
				
				//Comprueba si el item existe en el inventario
				var yy = 0; repeat(espacioInventario){
					if(ds_inv[# 0, yy] == in){
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					} else {
						yy += 1;
					}
				}
				//De otra manera, añade el item a un espacio vacio si hay
				if(! picked_up) {
					yy = 0; repeat(espacioInventario){
					if(ds_inv[# 0, yy] == objetos.none){
						ds_inv[# 0, yy] += in;
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					} else {
						yy += 1;
					}
					}
				}
			}
			//Destruye el item si es cogido
			if(picked_up){
				instance_destroy();
				show_debug_message("Picked up an item.");
			}
		}
	}
}