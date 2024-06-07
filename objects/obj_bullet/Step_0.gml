depth = -y;

image_angle = direction;
image_xscale += scale_speed_x;
image_yscale += scale_speed_y;

life--;

if floor(life) == 0 || floor(speed) = 0 || image_xscale < 0 {
	move_bounce_all(true);

	//create_particle(_pt, x, y, random_range(-direction/2, direction/2), irandom_range(3, 6))

	instance_destroy();
}

if homing {
	var _target = obj_player;
	var _acc = 0.3;
	var _spd_max = 2;
	
	friction = 0;
	
	if _target {
		var _p_dist = distance_to_object(_target);
		var _p_dir = point_direction(x, y, _target.x, _target.y);
			
		direction = lerp(direction, _p_dir, .3);
	}
	
	//print("homing!")
}