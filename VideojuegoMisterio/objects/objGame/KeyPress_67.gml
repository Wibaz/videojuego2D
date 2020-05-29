ini_open("Partida.ini");
global.PX = ini_read_real("Jugador", "PX", objPlayer.x);
global.PY = ini_read_real("Jugador", "PY", objPlayer.y);
currentRoom = ini_read_real("Jugador", "ROOM", 1);

global.key_up =			ini_read_real("Controles", "UP",		global.key_up);
global.key_down =		ini_read_real("Controles", "DOWN",		global.key_down);
global.key_right =		ini_read_real("Controles", "RIGHT",		global.key_right);
global.key_left =		ini_read_real("Controles", "LEFT",		global.key_left);
global.key_interact =	ini_read_real("Controles", "INTERACT",	global.key_interact);
global.key_escape =		ini_read_real("Controles", "ESCAPE",	global.key_escape);
ini_close();

room_goto(currentRoom);
objPlayer.x = global.PX;
objPlayer.y = global.PY;