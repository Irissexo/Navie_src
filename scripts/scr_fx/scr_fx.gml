// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function create_explosion(_x, _y, c_start, c_end) {
	with instance_create_depth(_x, _y, depth, obj_explosion) {
		color_s = c_start;
		color_e = c_end;
	}
}

function screen_shake(_amm) {
	obj_camera.shake = _amm;
}

enum part_profile {
	dust,
	trail,
}

function create_particle(_profile, _x, _y) {	
	switch _profile {
		case part_profile.dust:
			repeat irandom_range(4, 6) {
				var _part = instance_create_depth(_x, _y, depth - 1, obj_particle) 
				
				with _part {
					image_blend = c_white;
					
					radius = 8;
					speed = 2;
					friction = 0.2
				}
				
			}
		break;
		case part_profile.trail:
			repeat irandom_range(1, 2) {
				var _part = instance_create_depth(_x, _y, depth - 1, obj_particle) 
				
				with _part {
					image_blend = c_white;
					
					radius = 4;
					speed = 1;
					friction = 0.1;
				}
				
			}
		break;
	}
}