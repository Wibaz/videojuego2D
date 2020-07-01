if (room == puzzle1) {
	if (mouse_check_button(mb_left)) {
		if (idSelect == noone) {
			idSelect = instance_place (x, y, objDraggableItem);
		}
		else {
			with (idSelect) {
				if (mouse_x <= ((x + (sprite_width / 2)) - 64)) { // objDraggableItem esta a la derecha de objMouse
					if !(place_meeting(x - 64, y, objInvisibleWall2) || place_meeting(x - 64, y, objDraggableItem)) {
						x -= 64;
						objMouse.x -= 64;
					}			
				}
				if (mouse_x >= ((x + (sprite_width / 2)) + 64)) { // objDraggableItem esta a la izquierda de objMouse
					if !(place_meeting(x + 64, y, objInvisibleWall2) || place_meeting(x + 64, y, objDraggableItem)) {
						x += 64;
						objMouse.x += 64;
					}
				}
				if (mouse_y <= ((y + (sprite_height / 2)) - 64)) { // objDraggableItem esta abajo de objMouse
					if !(place_meeting(x, y - 64, objInvisibleWall2) || place_meeting(x, y - 64, objDraggableItem)) {
						y -= 64;
						objMouse.y -= 64;
					}
				}
				if (mouse_y >= ((y + (sprite_height / 2)) + 64)) {// objDraggableItem esta arriba de objMouse
					if !(place_meeting(x, y + 64, objInvisibleWall2) || place_meeting(x, y + 64, objDraggableItem)) {
						y += 64;
						objMouse.y += 64;
					}
				}
			}
		}
	}
	else {
		if (idSelect != noone) {
			var x_pos = (x-camera_get_view_x(view_camera[0])) / (camera_get_view_width(view_camera[0])-camera_get_view_x(view_camera[0]))
			var y_pos = (y-camera_get_view_y(view_camera[0])) / (camera_get_view_height(view_camera[0])-camera_get_view_y(view_camera[0]))
			window_mouse_set(window_get_width()*x_pos,window_get_height()*y_pos);
			idSelect = noone;
		}
		else {
			x = mouse_x;
			y = mouse_y;
		}
	}
}
else {
	x = mouse_x;
	y = mouse_y;
}