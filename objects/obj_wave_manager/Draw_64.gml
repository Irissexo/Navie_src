draw_set_font(fnt_monogram_normal);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

wave_title_x = lerp(wave_title_x, room_width/2, .1);

xscl = lerp(xscl, 1, .1)
yscl = lerp(yscl, 1, .1)

if !global.game_paused and !instance_exists(obj_gameover) {
	draw_text_transformed(wave_title_x, wave_title_y, "wave: " + string(curr_wave), xscl, yscl, 0);
	draw_text_transformed(wave_title_x, wave_title_y + 16, "score: " + string(global.points) + " / " + string(global.target_points), .5, .5, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

