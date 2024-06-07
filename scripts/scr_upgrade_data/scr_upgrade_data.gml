// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function BulletSpecial(_frame, _name, _desc, _b_atrib_func) constructor {
	type = SPECIAL;
	name = _name;
	desc = _desc;
	frame = _frame;
	spd = 5;
	
	bullet_func = _b_atrib_func;	
}

function Upgrade(_frame, _name, _desc, _func) constructor {
	type = UPGRADE;
	
	name = _name;
	desc = _desc;
	frame = _frame;
	
	func = _func;
}

#macro UPGRADE 0
#macro SPECIAL 1

#macro FRAME_ELETRIC 0
#macro FRAME_FLAME 1
#macro FRAME_UPHP 2
#macro FRAME_UPAMMO 3

global.bullet_specials = {
	eletric : new BulletSpecial(
		FRAME_ELETRIC,
		"ELETRIC",
		"just a basic eletric projectile",
		
		function() {
			var _bt = new bull_type();
				bull_type_set_sprite(_bt, spr_special_eletric, 0, 1);
				bull_type_set_damage(_bt, 3);
				bull_type_set_radial(_bt, 3, 30, true);
				bull_type_set_life(_bt, 30)
			
			return _bt;
			
		}
	),
	flame : new BulletSpecial(
		FRAME_FLAME,
		"FLAME",
		"FOGO NA BABILONIAAA",
		
		function() {
			var _bt = new bull_type();
				bull_type_set_sprite(_bt, spr_special_flame, 0, 1);
				bull_type_set_damage(_bt, 7);
			
			return _bt;
			
		}
	),
}

global.status_upgrades = {
	more_hp : new Upgrade(
		FRAME_UPHP,
		"Increase HP",
		"Increase HP duhhhh >:D",
		function() {
			obj_player.HP_max += 2;
			obj_player.HP = obj_player.HP_max;
		}
		
	),
	more_ammo : new Upgrade(
		FRAME_UPAMMO,
		"Increase ammo :3",
		"more special bullets yipeeee",
		function() {
			obj_player.ammo_max += 2;
			obj_player.ammo = obj_player.ammo_max;
		}		
	),
}

global.specials_arr = [
	global.bullet_specials.eletric,
	global.bullet_specials.flame,
]

global.stats_up_arr = [
	global.status_upgrades.more_ammo,
	global.status_upgrades.more_hp,
]

