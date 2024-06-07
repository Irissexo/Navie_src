
if instance_number(obj_asteroid) < 8 {
	var x1 = -16;
	var x2 = room_width + 16;
	var y1 = -16;
	var y2 = room_height + 16;

	
	var yy = random_range(y1, y2);

	instance_create_depth(choose(x1, x2), yy, depth, obj_asteroid)
}


asteroid_timer = irandom_range(12, 30);
alarm[0] = asteroid_timer;

