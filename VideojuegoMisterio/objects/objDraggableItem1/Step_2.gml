var nextX=0
var nextY=0;
if(Grabbed)
{
	nextX=mouse_x+xx;
	nextY=mouse_y+yy;

}

if(place_free(nextX,nextY)&&Grabbed)
{
	x=mouse_x+xx;
	y=mouse_y+yy;
	move_snap(64,64);
}