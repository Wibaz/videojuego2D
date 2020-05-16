//check if the player wants to move
var movX = 0;
var movY = 0;
var spritePlayer=sprite_index;

if (objGame.state == "IN_GAME") {
	if (keyboard_check(vk_left))
	{
		spritePlayer=sprPlayerLeft;
	    movX -=1;
	}
	if (keyboard_check(vk_right))
	{
		spritePlayer=sprPlayerRight
	    movX += 1;
	}
	if (keyboard_check(vk_up))
	{
		spritePlayer=sprPlayerUp
	    movY -= 1;
	}
	if (keyboard_check(vk_down))
	{
		spritePlayer=sprPlayerDown
	    movY += 1;
	}
	if (spritePlayer!=sprite_index)
		sprite_index=spritePlayer;
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


