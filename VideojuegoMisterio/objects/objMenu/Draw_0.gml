/*
//Draw the selector and change the option picture
// draw the indicator of what option we have currently selected
var selectorMiddleWidth = sprite_get_width(sprMenuPointer)/2;
var HeightSelection = sprite_get_height(sprMenuOff)/3;//Porque hay tres opciones y queremos que marque a mitad de cada una
var pointerPosY = y + HeightSelection/2;
var XPosSelection = sprite_get_width(sprMenuOff)/2;

var triX = x - selectorMiddleWidth;
	triY = pointerPosY + selectedOption * HeightSelection;//El 100 indica la cantidad de desplazamiento (vertical) en el menu

//Draw ourselves
draw_self();

//drawing the selection
if(selectedOption == 0){
	draw_sprite(sprPlayOn, -1, x + XPosSelection ,triY);
} else if(selectedOption == 1){
	draw_sprite(sprMenuOn, -1, x + XPosSelection ,triY);
} else if(selectedOption == 2){
	draw_sprite(sprExitOn, -1, x + XPosSelection ,triY);
}

draw_sprite(sprMenuPointer, 0, triX, triY);
*/