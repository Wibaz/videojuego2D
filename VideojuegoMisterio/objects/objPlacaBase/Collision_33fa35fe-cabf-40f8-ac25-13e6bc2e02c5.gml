//Arrastra la alimentación el cursor cuando hace click izq

if(mouse_check_button_pressed(mb_left)&& !objHardDisk.move && !objPower.move)
    move = true;

if (mouse_check_button(mb_left) && move = true)
{
    x = objMouse.x;
    y = objMouse.y;
}

//reset move var
if (!mouse_check_button(mb_left))
    move = false;