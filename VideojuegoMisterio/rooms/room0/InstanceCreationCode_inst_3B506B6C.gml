t_scene_info = [
	[cutscene_move_character, objPlayer, 179, 405, false, 1],
	[cutscene_play_sound, snd_voice3, 10, false],
	[cutscene_instance_destroy, objPlayer],
	
	[cutscene_wait, .20],
	
	[cutscene_instance_create, 383, 381, "Text", objPlayer],
];