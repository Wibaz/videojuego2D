// first check if we can fix this only moving in the X axis
if(!place_free(x,y))
{
	var prevX=x-hspeed;
	var prevY=y-vspeed;
    if (place_free(prevX, y))
    {
        //find the nearest position in the X axis
        FindFurthessFreePossition(prevX,y,x,y,0.5);

        //set the speed to 0 in the X axis
        x=prevX;
        hspeed=0;
    }
    else if (place_free(x,prevY))
    {
        //find the nearist valid position in the Y axis
        FindFurthessFreePossition(x,prevY,x,y,0.5);

        //set the speed to 0 in the Y axis
        y=prevY;
        vspeed=0;
    }
    else
    {
         // go back to the initial position and work from there
         FindFurthessFreePossition(prevX,prevY,x,y,0.5);

         //set the speed to 0 in both axis
        x=prevX;
        y=prevY;
        hspeed=0;
        vspeed=0;
    }

}
