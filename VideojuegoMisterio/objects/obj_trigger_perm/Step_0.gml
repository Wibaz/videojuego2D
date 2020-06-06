if(!instance_exists(obj_cutscene)){
	if(place_meeting(x, y, objPlayer)){
		create_cutscene(t_scene_info);
	}
}