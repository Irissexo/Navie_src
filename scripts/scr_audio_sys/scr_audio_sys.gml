// code credits: Chester on YT

// audio types
#macro au_type_sfx		"SFX"
#macro au_type_msc		"MSC"


function AudioController(_str_sfx, _str_msc, _str_master) constructor {
	global.__audio_controller = self;
	list_audio = ds_list_create();
	
	global_sfx = _str_sfx;
	global_msc = _str_msc;
	global_master = _str_master;
	
	// methods
	static Update = function() {
		vol_sfx = variable_global_get(global_sfx) * variable_global_get(global_master)
		vol_msc = variable_global_get(global_msc) * variable_global_get(global_master);
		
		var _size = ds_list_size(list_audio);
		for (var i = 0; i < _size; i++) {
			list_audio[| i].Update();
		}
	}
}

function AudioElement() constructor {
	controller = global.__audio_controller;
	
	ds_list_add(controller.list_audio, self);
	
	play = false;
	sound_id = noone;
	type = noone;
	offset = 1;	
	
	static Update = function() {
		// nothing to do here
	}
	
}

function AudioPlaySingle(_sound_arr, _au_type, _offset = 1) : AudioElement() constructor {
	sound_arr = _sound_arr;
	type = _au_type;
	offset = _offset;
	
	static Update = function() {
		if play && array_length(sound_arr) > 0 {		
			
			var _level;			
			switch type {
				case au_type_sfx:
					_level = controller.vol_sfx * offset;
					sound_id = sound_arr[irandom(array_length(sound_arr) - 1)]
					
				break;
				case au_type_msc:
					_level = controller.vol_msc * offset;
				break;
			}
			
			var _snd = audio_play_sound(sound_id, 0, false);			
			audio_sound_gain(_snd, _level, 0);
			audio_sound_pitch(_snd, random_range(0.7, 1.2))
			play = false;
		}
	}	
}

function AudioPlayLoop(_sound_id, _au_type, _millisec, _offset = 1) : AudioElement() constructor {
	sound_id = _sound_id;
	type = _au_type;
	offset = _offset;	
	id_playing = noone;
	vol = 0;
	vol_spd = game_get_speed(gamespeed_fps) * (_millisec * 0.001);
		
	static Update = function() {
		if play { 
			// tocando de fato
			if !audio_is_playing(id_playing) {
				id_playing = audio_play_sound(sound_id, 1, true);
				
				// aumentando volume
				if vol < 1 {vol += vol_spd} else {vol = 1};
			}			
		} else {
			if vol > 0 {vol -= vol_spd} else {
				vol = 0;
				
				audio_stop_sound(id_playing);				
			};
		}
		
		// definindo volume
		if audio_is_playing(id_playing) {			
			var _level;			
			switch type {
				case au_type_sfx:
					_level = controller.vol_sfx * vol * offset;					
				break;
				case au_type_msc:
					_level = controller.vol_msc * vol * offset;
				break;
			}
			
			audio_sound_gain(id_playing, _level, 0);
		}
	}
}





