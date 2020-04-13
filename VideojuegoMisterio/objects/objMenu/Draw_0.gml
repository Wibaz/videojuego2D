//Draw the selector and change the option picture
// draw the indicator of what option we have currently selected
var triX = x - 300;
	triY = y + selectedOption * 250;//El 100 indica la cantidad de desplazamiento (vertical) en el menu

//drawing the selection
if(selectedOption == 0){
	//draw_sprite(sprMenuPlay2, 0,x ,y);
	//draw_sprite(sprMenuExit1, 0, x, y + 150);
} else{
	//draw_sprite(sprMenuPlay1, 0,x ,y);
	//draw_sprite(sprMenuExit2, 0, x, y + 150);
}

draw_sprite(sprMenuPointer, 0, triX, triY);

draw_self();