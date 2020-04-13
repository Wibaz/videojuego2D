//get the inputs for the up and down arrows
if (keyboard_check_released(vk_up))
{
	//Change the select option
	if(selectedOption == 1)
		selectedOption = (selectedOption - 1) % 3;
	else
		selectedOption = 1;
}
else if (keyboard_check_released(vk_down))
{
	//change the select option
		selectedOption = (selectedOption + 1) % 3;//2 nº opciones
}
else if (keyboard_check_released(vk_return))
{
	//execute the menu option
	switch (selectedOption)
	{
		case 0:
			room_goto_next();
			break;
			
		case 1:
			game_end();
			break;
			
		case 2:
			game_end();
			break;
			
		default:
			show_message("Try again please.");
			break;
	}
}