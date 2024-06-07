global.points += pts_value;

if instance_number(obj_par_enemie) == 0 {
	with obj_wave_manager {
		next_wave();
		print("aaaaa")
	}
}

create_explosion(x, y, c_grey, c_white);
create_particle(part_profile.dust, x, y)

