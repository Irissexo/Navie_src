if room != t_room {
	image_alpha += spd;
	if image_alpha >= 1 {
		room_goto(t_room)
	}
} else {
	image_alpha -= spd;
	if image_alpha <= 0 {
		instance_destroy()
	}	
}
draw_set_alpha(image_alpha);

draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false)

draw_set_alpha(1);


