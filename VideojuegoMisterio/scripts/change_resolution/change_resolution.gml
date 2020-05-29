///@description change_resolution
///@arg value

//["800 x 600", "1024 x 768", "1280 x 1024", "1366 x 768", "1600 x 900", "1920 x 1080", "2560 x 1440"]

switch(argument0){
	case 0:
		window_set_size(800, 600);
		break;
	case 1:
		window_set_size(1024, 768);
		break;
	case 2:
		window_set_size(1280, 1024);
		break;
	case 3:
		window_set_size(1366, 768);
		break;
	case 4:
		window_set_size(1600, 900);
		break;
	case 5:
		window_set_size(1920, 1080);
		break;
	case 6:
		window_set_size(2560, 1440);
		break;
}