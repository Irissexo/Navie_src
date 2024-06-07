// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function hurt(_dmg = 1){
	if can_hurt == 0 {
		HP -= _dmg;
		can_hurt = hurt_max;
		
		global.sfx.combat.hit_hurt.play = true;
	}
}

function knockout(_amm, _other = other) {
	create_particle(part_profile.dust, x, y);

	var _dir = point_direction(x, y, _other.x, _other.y);
	hspd = lengthdir_x(-_amm, _dir);
	vspd = lengthdir_y(-_amm, _dir);
}

