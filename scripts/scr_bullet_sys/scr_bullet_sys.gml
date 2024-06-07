// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function bull_type() constructor {
	sprite_index = -1;
	image_index = 0;
	image_speed = 0;
	image_angle = 0;
	image_xscale = 1;
	image_yscale = 1;
	image_blend = c_white;
	image_alpha = 1;
	friction = 0;
	
	homing = false;
	
	scale_speed_x = 0;
	scale_speed_y = 0;
	
	radial = false;
	radial_number = 0;
	radial_cutoff = 360;
	
	from_enemy = false;
	
	life = -1;
	dmg = 1;
	
	static bull_type_set_atributes = function(o) {
		o.sprite_index					= sprite_index;
		o.image_index					= image_index;
		o.image_speed					= image_speed;
		o.image_angle					= image_angle;
		o.image_xscale					= image_xscale;
		o.image_alpha					= image_alpha;
		o.image_blend					= image_blend;
		o.friction						= friction;
		
		o.scale_speed_x					= scale_speed_x;
		o.scale_speed_y					= scale_speed_y;
		o.from_enemy					= from_enemy;
		o.life							= life;
		o.homing						= homing;
		o.dmg							= dmg;
	}
}

function bull_type_set_life(ind, l) {
	/// @func bull_type_set_life(bullet_index, life)
	ind.life = l;
}

function bull_type_set_sprite(ind, spr, idx, spd) {
	/// @func bull_type_set_sprite(bullet_index, sprite, image_index, image_speed)
	ind.sprite_index = spr;
	ind.image_index = idx;
	ind.image_speed = spd;
}

function bull_type_set_scale(ind, xs, ys, xscl, yscl) {
	/// @func bull_type_set_scale(bullet_index, xscale, yscale, xscale_speed, yscale_speed)
	ind.image_xscale = xs;
	ind.image_yscale = ys;
	ind.scale_speed_x = xscl;
	ind.scale_speed_y = yscl;
}

function bull_type_set_alpha(ind, alpha) {
	/// @func bull_type_set_alpha(bullet_index, alpha)
	ind.image_alpha = alpha;
}

function bull_type_set_damage(ind, dmg) {
	/// @func bull_type_set_damage(bullet_index, dmg)
	ind.dmg = dmg;
}

function bull_type_set_from_enemy(ind, is_from_enemy) {
	/// @func bull_type_set_from_enemy(bullet_index, is from enemy?)
	ind.from_enemy = is_from_enemy;
}


function bull_type_set_color(ind, color) {
	/// @func bull_type_set_color(bullet_index, color)
	ind.image_blend = color;
}

function bull_type_set_radial(ind, num, co, tf) {
	/// @func bull_type_set_radial(bullet_index, instance_number, cutoff_angle, enabled)
	ind.radial = tf;
	ind.radial_number = num;
	ind.radial_cutoff = co;
}

function bull_type_set_friction(ind, fric) {
	/// @func bull_type_set_friction(bullet_index, friction)
	ind.friction = fric;
}

function bull_type_set_homing(ind, _hom) {
	/// @func bull_type_set_homing(bullet_index, homing?)
	ind.homing = _hom;
}

function bull_type_create(ind, _x, _y, dir, spd) {
	/// @func bull_type_create(bullet_index, x, y, direction, speed)
	var ret = noone;
	var bull_obj = obj_bullet;
	
	if (ind.radial)  {
		var adiv = ind.radial_cutoff / (ind.radial_number - 1);
		var sdir = dir + (ind.radial_cutoff * 0.5);
		
		// cria as balas radiais
		for (var i = 0; i < ind.radial_number; i++) {
			var d = sdir - (i * adiv);
			var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, d);
			var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, d);
			
			var bul = instance_create_layer(xx, yy, "Instances", bull_obj);
			
			bul.direction = d;
			bul.image_angle = d;
			bul.speed = spd;
			
			ind.bull_type_set_atributes(bul);
			
			ret[i] = bul;
			
		}
		
	} else {
		// cria balas normais
		var xx = _x + lengthdir_x(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, dir);
		var yy = _y + lengthdir_y(sprite_get_width(ind.sprite_index) * 0.5 * ind.image_xscale, dir);
			
		var bul = instance_create_layer(xx, yy, "Instances", bull_obj);
		bul.direction = dir;
		bul.image_angle = dir;
		bul.speed = spd;
		
		ind.bull_type_set_atributes(bul);
		ret[0] = bul;
		
	}
	
}
