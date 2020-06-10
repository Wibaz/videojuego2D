//PANTALLA ERROR
//cuando el player pulse E vuelva a la anterior room y vuelva a hacer visible el personaje
if (keyboard_check(ord("E")) && !serverOk)
{
	objPlayer.visible = true;
	
	//El player permanece siempre en la posicion de aparicion
	objPlayer.x = orgX;
	objPlayer.y = orgY;
	
	room_goto(room0);
}
//Si el server esta arreglado vamos a la pantalla de inicio
else
 room_goto(Computer);