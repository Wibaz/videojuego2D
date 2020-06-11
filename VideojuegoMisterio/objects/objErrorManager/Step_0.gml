//PANTALLA ERROR
//cuando el player pulse E vuelva a la anterior room y vuelva a hacer visible el personaje
if (keyboard_check(vk_escape))
{
	objPlayer.x=orgX;
	objPlayer.y=orgY;
	room_goto(camaroteImportante);
	objPlayer.visible = true;
}