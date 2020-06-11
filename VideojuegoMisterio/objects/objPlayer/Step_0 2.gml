//check if the player wants to move
var movX = 0;
var movY = 0;
var spritePlayer=sprite_index;

if (playerMove == false) exit;

if (objGame.state == "IN_GAME") {
	if (keyboard_check(global.key_left))
	{
		spritePlayer=sprPlayerLeft;
		image_angle = 0;
		sprite_index=spritePlayer;
	    movX -=1;
	}
	else if (keyboard_check(global.key_right))
	{
		spritePlayer=sprPlayerRight;
		image_angle = 0;
		sprite_index=spritePlayer;
	    movX += 1;
	}
	else if (keyboard_check(global.key_up))
	{
		spritePlayer=sprPlayerUp;
		image_angle = 0;
		sprite_index=spritePlayer;
	    movY -= 1;
	}
	else if (keyboard_check(global.key_down))
	{
		spritePlayer=sprPlayerDown;
		image_angle = 0;
		sprite_index=spritePlayer;
	    movY += 1;
	}
	/*if (spritePlayer!=sprite_index)
	{
		sprite_index=spritePlayer;
	}*/
	//Ponemos las diferentes orientaciones cuando el player esta parado basandonos en el mov anterior
	else
	{
		if(spritePlayer == sprPlayerDown)
		{
			image_angle = 0;
			sprite_index = sprPlayerIddle;
		}
		else if (spritePlayer == sprPlayerUp)
		{
			image_angle = 180;
			sprite_index = sprPlayerIddle2;
		}
		else if (spritePlayer == sprPlayerRight)
		{
			image_angle = 0;
			sprite_index = sprPlayerIddle;
		}
		else if (spritePlayer == sprPlayerLeft)
		{
			image_angle = 180;
			sprite_index = sprPlayerIddle;
		}
	}
	input_interact = keyboard_check_pressed(global.key_interact);
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
if (place_meeting(x,y,objGoToComputer) && input_interact)
{
	//hacer que desaparezca el jugador al ir a la room del servidor
	other.visible = false;
	if (!global.serverOkay)
		room_goto(ErrorScreen);
	else
		room_goto(Computer)
}
if (place_meeting(x,y,objPuzzle1) && input_interact && !global.Key)
{
	//hacer que desaparezca el jugador al ir a la room delpuzzle
	other.visible = false;	
	room_goto(puzzle1);
}	