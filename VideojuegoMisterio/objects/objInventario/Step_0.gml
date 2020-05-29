if(keyboard_check_pressed(global.key_inventory)) {
	mostrarInventario = !mostrarInventario;
}

if(!mostrarInventario) exit;
#region Raton encima del espacio
ratonX = device_mouse_x_to_gui(0);
ratonY = device_mouse_y_to_gui(0);

var celda_Xbuff = (TamanyoCelda + xBuffer) * escala;
var celda_Ybuff = (TamanyoCelda + yBuffer) * escala;

var iRatonX = ratonX - espacioX;
var iRatonY = ratonY - espacioY;

var nx = iRatonX div celda_Xbuff;
var ny = iRatonY div celda_Ybuff;

var ratonEnInventario = true;
if(nx >= 0 and nx < espacioInventarioAncho and ny >= 0 and ny < espacioInventarioAlto){
	var sx = iRatonX - (nx * celda_Xbuff);
	var sy = iRatonY - (ny * celda_Ybuff);
	
	if((sx < TamanyoCelda * escala) and (sy < TamanyoCelda * escala)) {
		mEspacioX = nx;
		mEspacioY = ny;
	}
} else { ratonEnInventario = false; }

//Selecciona el espacio sgun la posicion del raton
espacioSelecionado = min(espacioInventario-1, 
	mEspacioX + (mEspacioY * espacioInventarioAncho)
);
#endregion

//Recoger el objeto

var inventarioGrid = ds_inventario;
var ss_objeto = inventarioGrid[# 0, espacioSelecionado];

if(recogerEspacio != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(! ratonEnInventario){
			#region Soltar el objeto en el mundo del juego
			var pitem = inventarioGrid[# 0, espacioSelecionado];
			inventarioGrid[# 1, espacioSelecionado] -= 1;
			//Destruye el objeto del inventario si fue el último
			if(inventarioGrid[# 1, espacioSelecionado] == 0) {
				inventarioGrid [# 0, espacioSelecionado] = objetos.none;
				espacioSelecionado = -1;
			}
		
			//Crea el item
			var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
			with(inst){
				item_num =pitem;
				x_frame = item_num mod (spr_anchura/TamanyoCelda);
				y_frame = item_num div (spr_anchura/TamanyoCelda);
			}
			show_debug_message("Dropped an item.");
			#endregion
			
		} else if(ss_objeto == objetos.none){
			inventarioGrid[# 0, espacioSelecionado] = inventarioGrid[# 0, recogerEspacio];
			inventarioGrid[# 1, espacioSelecionado] = inventarioGrid[# 1, recogerEspacio];
			
			inventarioGrid[# 0, recogerEspacio] = objetos.none;
			inventarioGrid[# 1, recogerEspacio] = 0;
			
			recogerEspacio = -1;
			
		} else if (ss_objeto == inventarioGrid[# 0, recogerEspacio]) {
			if(espacioSelecionado != recogerEspacio){
				inventarioGrid[# 1, espacioSelecionado] += inventarioGrid[# 1, recogerEspacio];
				inventarioGrid[# 0, recogerEspacio] = objetos.none;
				inventarioGrid[# 1, recogerEspacio] = 0;
			}
			
			recogerEspacio = -1;
		} else {
			var ss_objeto_num = inventarioGrid[# 1, espacioSelecionado];
			inventarioGrid[# 0, espacioSelecionado] = inventarioGrid[# 0, recogerEspacio];
			inventarioGrid[# 1, espacioSelecionado] = inventarioGrid[# 1, recogerEspacio];
			
			inventarioGrid[# 0, recogerEspacio] = ss_objeto;
			inventarioGrid[# 1, recogerEspacio] = ss_objeto_num;
			
			recogerEspacio = -1;
		}
	}
}
else if(ss_objeto != objetos.none){
	//Soltar el objeto en el mundo del juego
	if(mouse_check_button_pressed(mb_middle)){
		inventarioGrid[# 1, espacioSelecionado] -= 1;
		//Destruye el objeto del inventario si fue el último
		if(inventarioGrid[# 1, espacioSelecionado] == 0) {
			inventarioGrid [# 0, espacioSelecionado] = objetos.none;
		}
		
		//Crea el item
		var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
		with(inst){
			item_num = ss_objeto;
			x_frame = item_num mod (spr_anchura/TamanyoCelda);
			y_frame = item_num div (spr_anchura/TamanyoCelda);
		}
		show_debug_message("Dropped an item.");
	}
	
	//Soltar objeto en una nueva casilla
	if(mouse_check_button_pressed(mb_right)){
		recogerEspacio = espacioSelecionado;
	}
}