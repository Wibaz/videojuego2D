 //Miramos si esta el server arreglado
if (objPower.Colocado && objPlacaBase.Colocado && objHardDisk.Colocado)
{
    global.serverOkay = true;
	objPlayer.visible=true;
    room_goto(camaroteImportante);
	objPlayer.x = orgX;
	objPlayer.y = orgY;
}

//Colocamos y checkeamos cada pieza en su sitio
//Power
if (objPower.x > 400 && objPower.x < 432 && objPower.y > 368 && objPower.y < 400 && !keyboard_check_pressed(mb_left))
{
    objPower.x = 416;
    objPower.y = 384;
    objPower.Colocado = true;
}
//Placa Base
if (objPlacaBase.x > 400 && objPlacaBase.x < 432 && objPlacaBase.y > 234 && objPlacaBase.y < 266 && !keyboard_check_pressed(mb_left))
{
    objPlacaBase.x = 416;
    objPlacaBase.y = 250;
    objPlacaBase.Colocado = true;
}
//HHD
if (objHardDisk.x > 400 && objHardDisk.x < 432 && objHardDisk.y > 114 && objHardDisk.y < 146 && !keyboard_check_pressed(mb_left))
{
    objHardDisk.x = 416;
    objHardDisk.y = 130;
    objHardDisk.Colocado = true;
}