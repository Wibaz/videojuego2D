/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(canTextBox = true)
{
	if (keyboard_check_pressed(vk_space)) {
		if (charCount < string_length(text[page])) {
			charCount = string_length(text[page]);
		}
		else if ((page + 1) < array_length_1d(text)) {
			page++;
			charCount = 0;
		}
		else {
			instance_destroy();
			canTextBox = false;
			
		}
	}
}
