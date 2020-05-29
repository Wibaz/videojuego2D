///@description change_volume
///@arg value

var type = menu_option[pages];

switch(type){
	case 0:
		audio_master_gain(argument0);
		break;
	case 1:
		audio_group_set_gain(audiogroup_soundeffects, argument0, 0);
		break;
	case 2:
		audio_group_set_gain(audiogroup_music, argument0, 0);
		break;
}