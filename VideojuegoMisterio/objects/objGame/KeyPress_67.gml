if (!global.DestruirFinAnimacion || room==Computer || room=puzzle1 || room=ErrorScreen || room=PuzleOrdenador) exit;
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
global.Key =			ini_read_real("VariableGlobal", "Key",	global.Key);
global.Puzzle2Completado=ini_read_real("VariableGlobal", "Puzzle2Completado",	global.Puzzle2Completado);
global.IbukiParla=		ini_read_real("VariableGlobal", "IbukiParla2",	global.IbukiParla2);
global.DestruirIbuki=	ini_read_real("VariableGlobal", "DestruirIbuki",	global.DestruirIbuki);
global.DestruirOtrosNPC=ini_read_real("VariableGlobal", "DestruirOtrosNPC",	global.DestruirOtrosNPC);
global.FuenteDeAlimentacion=ini_read_real("VariableGlobal", "FuenteDeAlimentacion",	global.FuenteDeAlimentacion);
global.PlacaBase=		ini_read_real("VariableGlobal", "PlacaBase",	global.PlacaBase);
global.HardDisk=		ini_read_real("VariableGlobal", "HardDisk",	global.HardDisk);
global.serverOkay=		ini_read_real("VariableGlobal", "serverOkay",	global.serverOkay);
global.FinAnimacion=	ini_read_real("VariableGlobal", "FinAnimacion",	global.FinAnimacion);
global.DestruirFinAnimacion=ini_read_real("VariableGlobal", "DestruirFinAnimacion",	global.DestruirFinAnimacion);
global.PlayerVisible=ini_read_real("VariableJugador", "visible",	global.PlayerVisible);
ini_close();

room_goto(currentRoom);
objPlayer.x = global.PX;
objPlayer.y = global.PY;
