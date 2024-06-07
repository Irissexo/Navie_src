if instance_exists(target) {
	var dir = point_direction(x, y, target.x, target.y);
	ang = dir;
	if distance_to_object(obj_player) > 64 {
		hspd = lerp(hspd, lengthdir_x(spd, dir), acc);
		vspd = lerp(vspd, lengthdir_y(spd, dir), acc);
	} else {
		hspd = lerp(hspd, 0, acc);
		vspd = lerp(vspd, 0, acc);
		
		if can_shoot <= 0 {
			shoot();
		}
	}	
} else {
	hspd = lerp(hspd, 0, acc);
	vspd = lerp(vspd, 0, acc);
	
}

if can_shoot > 0 {can_shoot--};
if can_hurt > 0 {can_hurt--};

if HP <= 0 {instance_destroy()}

x += hspd;
y += vspd;

