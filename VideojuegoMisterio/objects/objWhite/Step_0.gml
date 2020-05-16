/// @desc Puede escribir o no?
if PuedeEscribir == true
{
	image_index = 1; //Cambiar la imagen del campo de texto que a "escribiendo" (opcional)
	
	if string_width(Texto) < TX-16-32 or keyboard_check(vk_backspace) //Limitar o borrar
	{
		Texto = keyboard_string; //Actualizar la variable Texto
	}
	else //Si no
	{
		keyboard_string = Texto; //Mantener el string del teclado con el texto
	}
}
else //de lo contrario
{
	image_index = 0; //Cambiar imagen a "No escribiendo"
}




//Si estás haciendo clic, puedes escribir
if mouse_check_button(mb_left)
{
	//Si el mouse está entre la posiciones X Y del tamaño de la caja de texto...
	if (mouse_x >= x && mouse_x <= x+TX) &&  (mouse_y >= y && mouse_y <= y+TY)
	{
		keyboard_string = Texto; //Cargar el texto dentro del string temporal del teclado
		PuedeEscribir = true; //Ahora ya puede escribir
	}
	else //de lo contrario
	{
		PuedeEscribir = false; //No puede escribir
	}
}



//Que tal si presiono la tecla enter?
if keyboard_check(vk_enter)
{
	PuedeEscribir = false;	//Entonces no puedes escribir mas
}



