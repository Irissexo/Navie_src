if global.game_paused {exit;}

get_input();

hspd = lerp(hspd, (right-left), acc);
vspd = lerp(vspd, (down-up), acc);

dir = point_direction(x, y, mouse_x, mouse_y);

if can_shoot == 0 {
	if shoot {
		bull_type_create(curr_bul, x, y, dir, 8);
		screen_shake(2);
		hspd -= lengthdir_x(spd/3, dir)
		vspd -= lengthdir_y(spd/3, dir)
		
		global.sfx.combat.shoot.play = true;
		
		can_shoot = 15;
	}
	
	if use_special and special != -1 and ammo > 0 {
		var _bt = special.bullet_func()
		
		bull_type_create(_bt, x, y, dir, special.spd)
		
		hspd -= lengthdir_x(spd/3, dir)
		vspd -= lengthdir_y(spd/3, dir)
		
		global.sfx.combat.shoot.play = true;
		
		can_shoot = 15;
		ammo -= 1;
	}
}

if can_shoot > 0 {can_shoot --}
if can_hurt > 0 {
	can_hurt --;
	image_alpha = wave(1, 0, .2, 0);
} else {
	image_alpha = lerp(image_alpha, 1, .1)
}

if HP <= 0 {
	instance_destroy();
	create_explosion(x, y, c_white, c_white);
	create_particle(part_profile.dust, x, y);
	
	instance_create_depth(0, 0, 0, obj_gameover);
	global.sfx.combat.player_death.play = true;
	global.sfx.combat.hit_hurt.play = true;
	screen_shake(5)
}

collide([obj_solid])




