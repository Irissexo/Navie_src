objs = [
	obj_controller,
	obj_SND,
	obj_camera,
	obj_mira
]

rm = rm_main_menu;

for (var i = 0; i < array_length(objs); i++) {
	instance_create_depth(x, y, depth, objs[i]);
}

room_goto(rm)

