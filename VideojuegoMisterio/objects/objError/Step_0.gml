//cuando el player pulse E vuelva a la anterior room y vuelva a hacer visible el personaje
if (keyboard_check(ord("E")))
{
	objPlayer.visible = true;
	
	//El player permanece siempre en la posicion de aparicion
	objPlayer.x = orgX;
	objPlayer.y = orgY;
	
	room_goto(room0);
}	