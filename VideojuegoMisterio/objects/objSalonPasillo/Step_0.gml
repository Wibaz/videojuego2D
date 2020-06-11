/// Artualización del teletransporte
if (place_meeting(x, y, objPlayer)) {
	if (objGame.alpha > 0) {
		objGame.state = "IN_ROOM_TRANSITION_ENTER";
	}
	else {
		room_goto (targetRoom);
		objPlayer.x = targetX;
		objPlayer.y = targetY;
		if(global.FinAnimacion)
			global.DestruirFinAnimacion=true;
	}
}