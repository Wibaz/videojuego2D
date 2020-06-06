///@description create_mouse_pointer

if(mouse_check_button_pressed(mb_left)){
	instance_create_layer(mouse_x, mouse_y, "Instances", objTP);
	cutscene_end_action();
}