if(!mostrarInventario) exit;

//-------------Atras del inventario
draw_sprite_part_ext(
	sprInvUI, 0, TamanyoCelda, 0, invUIAncho, 
	invUIAlto, invUIX, invUIY, escala, escala, 
	c_white, 1
);

//---------Información jugador

var infoGrid = ds_jugador_informacion;

draw_set_font(fntInventario24);
var c = c_black;
draw_text_color(infoX, infoY, infoGrid[# 0, 3] + ": "
	+ infoGrid[# 1, 3], c, c, c, c, 1
);
	
draw_set_font(fntInventarioNumPequenyo);
var yy = 0; repeat(3){
	draw_text_color(infoX + (192 * escala) + 
		((15 + 18) * escala * yy), infoY, 
		string(infoGrid[# 1, yy]), c,c,c,c, 1
	)
	yy += 1;
}

//---------Inventario
var ii, ix, iy, xx, yy, sx, sy, iiObjeto, invetarioGrid;
ii = 0; ix = 0; iy = 0; invetarioGrid = ds_inventario;

repeat(espacioInventario){
	//x, y localizacion para el espacio
	xx = espacioX + ((TamanyoCelda + xBuffer) * ix * escala);
	yy = espacioY + ((TamanyoCelda + yBuffer) * iy * escala);
	
	//Objeto
	iiObjeto = invetarioGrid[# 0, ii];
	sx = (iiObjeto mod sprInvObjetosColumnas) * TamanyoCelda;
	sy = (iiObjeto div sprInvObjetosColumnas) * TamanyoCelda;
	
	//Dibujar espacio y objeto
	draw_sprite_part_ext(sprInvUI, 0, 0, 0, 
		TamanyoCelda, TamanyoCelda, xx, yy, 
		escala, escala, c_white, 1
	);
	switch(ii){
		case espacioSelecionado:
			if(iiObjeto > 0) draw_sprite_part_ext(
				sprInvObjetos, 0, sx, sy, TamanyoCelda, 
				TamanyoCelda, xx, yy, escala, escala, 
				c_white, 1
			);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(sprInvUI, 0, 0, 0, 
				TamanyoCelda, TamanyoCelda, xx, yy, 
				escala, escala, c_white, .3
			);
			gpu_set_blendmode(bm_normal);
		break;
		
		case recogerEspacio:
			if(iiObjeto > 0) draw_sprite_part_ext(
				sprInvObjetos, 0, sx, sy, TamanyoCelda, 
				TamanyoCelda, xx, yy, escala, escala, 
				c_white, 0.2
			);
		break;
		
		default:
			if(iiObjeto > 0) draw_sprite_part_ext(
				sprInvObjetos, 0, sx, sy, TamanyoCelda, 
				TamanyoCelda, xx, yy, escala, escala, 
				c_white, 1
			);
		break;
	}
	
	//Dibujar numero objeto
	if(iiObjeto > 0){
		var numero = invetarioGrid[# 1, ii];
		draw_text_color(xx, yy, string(numero),
			c,c,c,c, 1
		);
	}
	
	//Incrementar
	ii += 1;
	ix = ii mod espacioInventarioAncho;
	iy = ii div espacioInventarioAncho;
}

//Dibujar descripción del objeto
var iinfoGrid = dsObjetosInfo, descripcion = "";
iiObjeto = invetarioGrid[# 0, espacioSelecionado];

if (iiObjeto > 0) {
	draw_set_font(fntInventario12);
	descripcion = iinfoGrid[# 0, iiObjeto] + ". " + iinfoGrid[# 1, iiObjeto];
	c = c_black;
	draw_text_ext_color(descX, descY, descripcion, string_height("M"), (invUIAncho * escala) - (xBuffer * 2), c,c,c,c, 1);
}

if(recogerEspacio != -1){
	//Objeto
	iiObjeto = invetarioGrid[# 0, recogerEspacio];
	sx = (iiObjeto mod sprInvObjetosColumnas) * TamanyoCelda;
	sy = (iiObjeto div sprInvObjetosColumnas) * TamanyoCelda;
	draw_sprite_part_ext(
		sprInvObjetos, 0, sx, sy, TamanyoCelda, 
		TamanyoCelda, ratonX, ratonY, escala, escala, 
		c_white, 1
	);
	
	var inum = invetarioGrid[# 1, recogerEspacio];
	draw_text_color(ratonX + (TamanyoCelda * escala * 0.5), ratonY, string(inum),
		c,c,c,c, 1
	);
}