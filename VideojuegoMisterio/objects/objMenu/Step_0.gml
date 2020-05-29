//Nuevo
if(!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[pages], ds_height = ds_grid_height(ds_grid);

if(inputting) {
	switch(ds_grid[# 1, menu_option[pages]]){
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if(hinput != 0){
				//audio
				ds_grid[# 3, menu_option[pages]] += hinput;
				ds_grid[# 3, menu_option[pages]] = clamp(ds_grid[# 3, menu_option[pages]], 0, array_length_1d(ds_grid[# 4, menu_option[pages]]) - 1);
			}
			break;
		
		case menu_element_type.slider:
			switch(menu_option[pages]){
				case 0:
					//Master
					if(!audio_is_playing(snd_voice4)){
						audio_play_sound(snd_voice4, 1, false);
					}
					break;
				case 1:
					//Effects example
					if(!audio_is_playing(snd_voice4)){
						audio_play_sound(snd_voice4, 1, false);
					}
					break;
				case 2:
					//Music
					if(!audio_is_playing(snd_sea)){
						audio_play_sound(snd_sea, 1, false);
					}
					break;
			}
			
			var hinput = keyboard_check(global.key_right) - keyboard_check(global.key_left);
			if(hinput != 0){
				ds_grid[# 3, menu_option[pages]] += hinput * 0.01;
				ds_grid[# 3, menu_option[pages]] = clamp(ds_grid[# 3, menu_option[pages]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[pages]], ds_grid[# 3, menu_option[pages]]);
			}
			break;
			
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if(hinput != 0){
				//audio
				ds_grid[# 3, menu_option[pages]] += hinput;
				ds_grid[# 3, menu_option[pages]] = clamp(ds_grid[# 3, menu_option[pages]], 0, 1);
			}
			break;
			
		case menu_element_type.input:
			var kk = keyboard_lastkey;
			if(kk != vk_enter){
				if(kk != ds_grid[# 3, menu_option[pages]]){ //audio
					ds_grid[# 3, menu_option[pages]] = kk;
				}
				variable_global_set(ds_grid[# 2, menu_option[pages]], kk);
			}
			break;
	}
}
else {
	var ochange = input_down_p - input_up_p;
	if (ochange != 0){
		menu_option[pages] += ochange;
		if(menu_option[pages] > ds_height - 1){
			menu_option[pages] = 0;
		}
		if(menu_option[pages] < 0) {
			menu_option[pages] = ds_height - 1;
		}
		audio_play_sound(snd_voice4, 5, false);
	}
}

if(input_enter_p){
	switch(ds_grid[# 1, menu_option[pages]]) {
		case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[pages]]);
			break;
		case menu_element_type.page_transfer:
			pages = ds_grid[# 2, menu_option[pages]];
			break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle:
			if(inputting){
				script_execute(ds_grid[# 2, menu_option[pages]], ds_grid[# 3, menu_option[pages]]);
			}
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	audio_play_sound(snd_voice4, 5, false);
}



//Viejo
/*
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
			show_message("Not implemented yet");
			break;
			
		case 2:
			game_end();
			break;
			
		default:
			show_message("Try again please.");
			break;
	}
}
*/