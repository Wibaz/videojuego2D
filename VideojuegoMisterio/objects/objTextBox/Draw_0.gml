/// @description Inserte aquí la descripción

//Draw TextBox
draw_rectangle(x - 2, y - 2, x + boxWidth + 2, y + boxHeight + 2, false);
draw_sprite(sprTextBox, 0 , x, y);
//Draw Text
draw_set_font(fntTextBox);

if (charCount < string_length(text[page])) {
	charCount += 0.5;
}
textPart = string_copy(text[page], 1, charCount);

//Dibujar el nombre
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_text(x + (boxWidth / 2), y + yBuffer, name);
draw_set_halign(fa_left);

//Dibujar parte del texto
draw_set_color(c_white);
draw_text_ext(x + xBuffer, y + stringHeight + yBuffer, textPart, stringHeight, boxWidth - (2 * xBuffer));