/// Artualización del teletransporte
if (place_meeting(x, y, objPlayer)) {
	if (objGame.alpha > 0) {
		objGame.state = "IN_ROOM_TRANSITION_ENTER";
	}
	else {
		if(global.IbukiParla)
			global.DestruirIbuki=true;
		if(!global.Puzzle2Completado)
			global.DestruirOtrosNPC=true;
		room_goto (targetRoom);
		objPlayer.x = targetX;
		objPlayer.y = targetY;		
	}
}