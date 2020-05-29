currentRoom = room;

ini_open("Partida.ini");
ini_write_real("Jugador", "PX", objPlayer.x);
ini_write_real("Jugador", "PY", objPlayer.y);
ini_write_real("Jugador", "ROOM", currentRoom);

ini_write_real("Controles", "UP",		global.key_up);
ini_write_real("Controles", "DOWN",		global.key_down);
ini_write_real("Controles", "RIGHT",	global.key_right);
ini_write_real("Controles", "LEFT",		global.key_left);
ini_write_real("Controles", "INTERACT",	global.key_interact);
ini_write_real("Controles", "ESCAPE",	global.key_escape);
ini_close();