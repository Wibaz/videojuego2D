/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();
if(x==512 && y==64)
{
	global.Key=true;
	if (objGame.alpha > 0) {
		objGame.state = "IN_ROOM_TRANSITION_ENTER";
	}
	else {
		room_goto (Cubierta);
		objPlayer.x = 476;
		objPlayer.y = 315;
		objPlayer.visible = visible;
	}
}

