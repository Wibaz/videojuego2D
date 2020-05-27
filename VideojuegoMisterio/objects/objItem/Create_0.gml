event_inherited();

TamanyoCelda = 32;
item_spr = borrarTesteoInventarioItems;
spr_anchura = sprite_get_width(item_spr);
spr_altura = sprite_get_height(item_spr);

item_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = TamanyoCelda/2;
y_offset = TamanyoCelda * (2/3);

drop_move = true;
var itemdir = irandom_range(0, 259);
var len		= 32;
goal_x		= x + lengthdir_x(len, itemdir);
goal_y		= y + lengthdir_y(len, itemdir);