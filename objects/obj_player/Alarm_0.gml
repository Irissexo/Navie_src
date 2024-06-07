get_input()
if !global.game_paused {
	if (right-left) != 0 or (down-up) != 0 {
		var xx = x - lengthdir_x(sprite_width/4, dir)
		var yy = y - lengthdir_x(sprite_width/4, dir)
	
		create_particle(part_profile.trail, xx, yy);
	}
}

alarm[0] = 5;

