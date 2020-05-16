
ini_open("Partida.ini");
global.PX = ini_read_real("Jugador", "PX", objPlayer.x);
global.PY = ini_read_real("Jugador", "PY", objPlayer.y);
currentRoom = ini_read_real("Jugador", "ROOM", 1);
ini_close();

room_goto(currentRoom);
objPlayer.x = global.PX;
objPlayer.y = global.PY;