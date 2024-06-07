hspd = 0;
vspd = 0;

spd = 0.4;
acc = .1;

HP = HP_max;
can_hurt = 0;

ang = 0;

if position_meeting(x, y, obj_par_enemie) {
	y += obj_par_enemie.sprite_width * 2;
}

