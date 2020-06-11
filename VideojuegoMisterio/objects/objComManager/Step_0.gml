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
if (objPower.x > 366 && objPower.x < 466 && objPower.y > 334 && objPower.y < 434 && !keyboard_check_pressed(mb_left))
{
    objPower.x = 416;
    objPower.y = 384;
    objPower.Colocado = true;
}
//Placa Base
if (objPlacaBase.x > 366 && objPlacaBase.x < 466 && objPlacaBase.y > 200 && objPlacaBase.y < 300 && !keyboard_check_pressed(mb_left))
{
    objPlacaBase.x = 416;
    objPlacaBase.y = 250;
    objPlacaBase.Colocado = true;
}
//HHD
if (objHardDisk.x > 366 && objHardDisk.x < 466 && objHardDisk.y > 80 && objHardDisk.y < 180 && !keyboard_check_pressed(mb_left))
{
    objHardDisk.x = 416;
    objHardDisk.y = 130;
    objHardDisk.Colocado = true;
}