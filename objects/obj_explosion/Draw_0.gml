color_merge += 1

explosion_c = merge_color(color_s, color_e, color_merge);
explosion_rad = lerp(explosion_rad, 14, 0.08)

if explosion_rad >= 12.4 {
	instance_destroy();
}

//if surface_exists(fx_surf) {
//	surface_set_target(fx_surf);
//	draw_clear_alpha(c_white, 0);	
		
	draw_circle_color(x, y, 10, explosion_c, explosion_c, false)
	
	//surface_reset_target();
	
	//draw_surface(fx_surf, 0, 0);
	gpu_set_blendmode(bm_subtract);
	
	draw_circle(x, y, explosion_rad, false);
	
	gpu_set_blendmode(bm_normal);

//} else {
//	fx_surf = surface_create(room_width, room_height);
//}