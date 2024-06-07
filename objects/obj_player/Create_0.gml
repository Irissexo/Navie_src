hspd = 0;
vspd = 0;

dir = 0;

spd = 2.5;
acc = .1;

curr_bul = new bull_type();
	bull_type_set_sprite(curr_bul, spr_bullet, 0, 0);
	bull_type_set_damage(curr_bul, 1);

can_shoot = 0;
can_hurt = 0;
hurt_max = 15;

HP = HP_max;

alarm[0] = 5;

special = -1;

ammo_max = 3;
ammo = ammo_max;
points = 0

global.player_upgrades = [];


get_input = function() {
	right = keyboard_check(ord("D"))
	left = keyboard_check(ord("A"))
	down = keyboard_check(ord("S"))
	up = keyboard_check(ord("W"))
	
	shoot = mouse_check_button(mb_left);
	use_special = mouse_check_button_pressed(mb_right);
}
