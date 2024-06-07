if can_hurt > 0 {
	shader_set(shd_flash);
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		1,
		1,
		ang,
		c_white,
		1
	)
	
	shader_reset();
} else {	
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		1,
		1,
		ang,
		c_white,
		1
	)
}