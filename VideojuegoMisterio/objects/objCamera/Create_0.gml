/// @description Inserte aquí la descripción

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);
/*
var x1 = 400;
var y1 = 400;
var x2 = 600;
var y2 = 600;

vertex_add_point(vbuffer, x1, y1, 100,	0, 0, 1,	0, 0,	c_white, 1);
vertex_add_point(vbuffer, x2, y1, 100,	0, 0, 1,	0, 0,	c_white, 1);
vertex_add_point(vbuffer, x2, y2, 100,	0, 0, 1,	0, 0,	c_white, 1);

vertex_add_point(vbuffer, x2, y2, 100,	0, 0, 1,	0, 0,	c_aqua, 1);
vertex_add_point(vbuffer, x1, y2, 100,	0, 0, 1,	0, 0,	c_blue, 1);
vertex_add_point(vbuffer, x1, y1, 100,	0, 0, 1,	0, 0,	c_green, 1);
*/

var s = 128;
for (var i = 0; i < room_width; i += s) {
	for (var j = 0; j < room_height; j += s) {
		if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)) {
			var color = c_aqua;
		} else {
			var color = c_white;
		}
		
		vertex_add_point(vbuffer, i, j, 100,			0, 0, 1,	0, 0,	color, 1);
		vertex_add_point(vbuffer, i + s, j, 100,		0, 0, 1,	1, 0,	color, 1);
		vertex_add_point(vbuffer, i + s, j + s, 100,	0, 0, 1,	1, 1,	color, 1);

		vertex_add_point(vbuffer, i + s, j + s, 100,	0, 0, 1,	1, 1,	color, 1);
		vertex_add_point(vbuffer, i, j + s, 100,		0, 0, 1,	0, 1,	color, 1);
		vertex_add_point(vbuffer, i, j, 100,			0, 0, 1,	0, 0,	color, 1);
	}
}

vertex_end(vbuffer);