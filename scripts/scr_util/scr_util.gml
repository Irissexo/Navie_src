/// @function with_tagged(tag, lambda)
/// @param tag The tag or array of tags to operate on
/// @param lambda An inline function to be run
/// Applies the lambda function provided to every instance with a given tag
function with_tagged(tag, lambda) {
	var tagged = tag_get_asset_ids(tag, asset_object);
	for (var i = 0; i < array_length(tagged); i++) {
		with (tagged[i]) {
			var boundMethod = method(self, lambda);
			boundMethod();
		}
	}
}

#macro UNPAUSE_OBJS [obj_mira, obj_SND, obj_upgrade_manager, obj_camera, obj_controller, obj_paused]

function pause_game() {
	global.game_paused = true
			
	instance_deactivate_all(true);
	
	for (var i = 0; i < array_length(UNPAUSE_OBJS); i++) {
		instance_activate_object(UNPAUSE_OBJS[i]);
	}
	
	return global.game_paused;
}

function unpause_game() {
	global.game_paused = false
	
	
	surface_free(global.pause_surf);
	global.pause_surf = -1;
		
	instance_activate_all();
	
	return global.game_paused;
	
}

function show_upgrade_screen() {	
	var inst = instance_create_depth(0, 0, 0, obj_upgrade_manager);
	
	static up_num = 6;
	
	with inst {
		
		repeat(up_num) {
			var _up = global.specials_arr[irandom(array_length(global.specials_arr) - 1)];

			if !array_contains_value(upgrades, _up) {
				array_push(upgrades, _up);				
			} else {
				var _melhoria = global.stats_up_arr[irandom(array_length(global.stats_up_arr) - 1)];
				if !array_contains_value(upgrades, _melhoria) {
					array_push(upgrades, _melhoria)
				}
			}
		}
	}
	
	return inst;
}