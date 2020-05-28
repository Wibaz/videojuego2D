//Lo nuevo
if (!objParentNPC.can_move) exit;

//check if the player wants to move
var movX = 0;
var movY = 0;
var spritePlayer=sprite_index;

if (objGame.state == "IN_GAME") {
	if (keyboard_check(ord("A")))
	{
		spritePlayer=sprPlayerLeft;
	    movX -=1;
	}
	if (keyboard_check(ord("D")))
	{
		spritePlayer=sprPlayerRight
	    movX += 1;
	}
	if (keyboard_check(ord("W")))
	{
		spritePlayer=sprPlayerUp
	    movY -= 1;
	}
	if (keyboard_check(ord("S")))
	{
		spritePlayer=sprPlayerDown
	    movY += 1;
	}
	if (spritePlayer!=sprite_index)
	{
		sprite_index=spritePlayer;
	}
	input_interact = keyboard_check_pressed(ord("E"));
}

//Textbox
if(input_interact) {
	
	if (active_textbox == noone){
		var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, objParentNPC, false, false);
		if (inst != noone){
			with(inst) {
				var tbox = create_textbox(text, speakers, next_line);
				can_move = false;
				movX = 0;
				movY = 0;
			}
			active_textbox = tbox;
		}
	}
	else {
		if (!instance_exists(active_textbox)) {
			active_textbox = noone;
		}
	}
}

//calculate the new velocities with aceleration

var targetSpeedX = movX * maxVel;
var targetSpeedY = movY * maxVel;
var offsetSpeedX = targetSpeedX - hspeed;
offsetSpeedX= clamp(offsetSpeedX, -accel, accel);
hspeed+= offsetSpeedX;

var offsetSpeedY = targetSpeedY - vspeed;
offsetSpeedY = clamp(offsetSpeedY, -accel, accel);
vspeed+=offsetSpeedY;


//computer
if (place_meeting(x,y,objGoToComputer)) {
	if (keyboard_check(vk_space)) {
		global.PX = objPlayer.x;
		global.PY = objPlayer.y;
		objPlayer.x = 10000;
		objPlayer.y = 10000;
		room_goto(Computer);
	}
}




