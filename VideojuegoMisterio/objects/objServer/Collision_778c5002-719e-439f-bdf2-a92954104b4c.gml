//cuando el jugador se aproxime y pulse la e va a la room del puzle
if(keyboard_check(ord("E")))
{
	//hacer que desaparezca el jugador al ir a la room del servidor
	other.visible = false;
	
	room_goto(PuzleOrdenador);
}