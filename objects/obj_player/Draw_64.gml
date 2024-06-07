if !global.game_paused {
	var _ui_spr_w = sprite_get_width(spr_ui_bullets);

	// empty heart
	var _heartx = 4

	for (var i = 0; i < HP_max; i++) {
		draw_sprite(spr_ui_life, 1, _heartx + (i * 7), room_height - 16)
	}

	// heart
	for (var i = 0; i < floor(HP); i++) {
		draw_sprite(spr_ui_life, 0, _heartx + (i * 7), room_height - 16)
	}

	// empty ammo
	var _ammox = room_width - 10;

	for (var i = 0; i < ammo_max; i++) {
		draw_sprite(spr_ui_bullets, 1, _ammox - (i * _ui_spr_w), room_height - 16)
	}

	// ammo
	for (var i = 0; i < floor(ammo); i++) {
		draw_sprite(spr_ui_bullets, 0, _ammox - (i * _ui_spr_w), room_height - 16)
	}


	//// special
	//special_bar.draw(_ammox - 16, room_height - 24, c_yellow, c_black, c_black)

}