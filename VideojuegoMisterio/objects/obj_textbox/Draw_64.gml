//Dibujar cuadro de texto
draw_sprite(box, 0, box_x, box_y);

//Dibujar retrato hacia atrás
draw_sprite(frame, 0, port_x, port_y);

//Dibujar retrato
draw_sprite(portrait, portrait_index, port_x, port_y);

//Dibujar marco del retrato
draw_sprite(frame, 1, port_x, port_y);

//Dibujar el cuadro de texto con el nombre
draw_sprite(namebox, 0, namebox_x, namebox_y);

//Texto
draw_set_font(font);

//Dibujar el nombre
var c = name_text_col;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(name_text_x, name_text_y, name, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(!choice_dialogue){
	//Dibujar el texto
	if(!pause and counter < str_len) {
		counter++;
		if (counter mod 4 == 0) {
			audio_play_sound(voice, 10, false);
		}
		switch(string_char_at(text_wrapped, counter)) {
			case ",":
				pause = true;
				alarm [0] = 15;
				break;
			case ".":
			case "?":
			case "!":
				pause = true;
				alarm [0] = 25;
				break;
		}
	}
	var substr = string_copy(text_wrapped, 1, counter);
	c = text_col;
	draw_text_color(text_x, text_y, substr, c,c,c,c, 1);
}
else {
	c = text_col;
	
	var i = 0;
	var y_add = 0;
	repeat(text_array_len){
		if (choice == i) {
			c = choice_col;
			draw_text_color(box_x + text_max_width, text_y + y_add, "<", c,c,c,c, 1);
		}
		else {
			c = text_col;
		}
		draw_text_ext_color(text_x, text_y + y_add, text_array[i], text_height, text_max_width, c,c,c,c, 1);
		y_add += string_height_ext(text_array[i], text_height, text_max_width);
		i++;
	}
}