currentRoom = room;

ini_open("Partida.ini");
ini_write_real("Jugador", "PX", objPlayer.x);
ini_write_real("Jugador", "PY", objPlayer.y);
ini_write_real("Jugador", "ROOM", currentRoom);
ini_close();