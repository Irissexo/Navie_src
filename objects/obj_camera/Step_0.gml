if shake > 0 {
	x += random_range(-shake, shake);
	y += random_range(-shake, shake);
	
	shake--;
} else {
	x = lerp(x, 0, .1);
	y = lerp(y, 0, .1);
}

camera_set_view_pos(view_camera[0], x, y)