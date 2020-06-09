global.scene		= 0;
global.pause		= true;
global.view_width	= camera_get_view_width(view_camera[0]);
global.view_height	= camera_get_view_height(view_camera[0]);

global.key_escape	= vk_escape;
global.key_enter	= vk_enter;
global.key_left		= ord("A");
global.key_right	= ord("D");
global.key_up		= ord("W");
global.key_down		= ord("S");
global.key_interact	= ord("E");
global.key_inventory= ord("I");

display_set_gui_size(global.view_width, global.view_height);

enum menu_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//CREATE MENU PAGES
ds_menu_main = create_menu_page(
	["RESUME",		menu_element_type.script_runner,	resume_game],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	exit_game],
);

ds_settings = create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = create_menu_page(
	["MASTER",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["SOUNDS",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["MUSIC",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_graphics = create_menu_page(
	["RESOLUTION",	menu_element_type.shift,			change_resolution,		0,		["800 x 600", "1024 x 768", "1280 x 1024", "1366 x 768", "1600 x 900", "1920 x 1080", "2560 x 1440"]],
	["WINDOW MODE",	menu_element_type.toggle,			change_window_mode,		1,		["FULLSCREEN", "WINDOWED"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_controls = create_menu_page(
	["UP",			menu_element_type.input,			"key_up",				global.key_up],
	["LEFT",		menu_element_type.input,			"key_left",				global.key_left],
	["RIGHT",		menu_element_type.input,			"key_right",			global.key_right],
	["DOWN",		menu_element_type.input,			"key_down",				global.key_down],
	["ESCAPE",		menu_element_type.input,			"key_escape",			global.key_escape],
	["INTERACT",	menu_element_type.input,			"key_interact",			global.key_interact],
	["INVENTORY",	menu_element_type.input,			"key_inventory",		global.key_inventory],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings],
);

pages = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls]

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);