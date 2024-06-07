pause = new Menu()
	.add_button("resume", function() {
		instance_destroy();
		unpause_game()
	})
	.add_button("options", function() {
		menu = opt;
		position = 0;
	})
	.add_button("quit", function() {
		//TransitionStart(rm_main_menu, sq_transic_in, sq_transic_out);
		trans_to(rm_main_menu)
	});


opt = new Menu()
	.add_button("back", function() {
		menu = pause;
		menu.position = 0;
	})
	.add_carousel("Window Mode", ["Windowed", "Full"], window_get_fullscreen(), function(_value) {
		window_set_fullscreen(_value);
		if !window_get_fullscreen() {
			window_center();
		}
	})
	.add_slider("Master Vol", 0, 1, .1, global.VOL_MASTER, 32, function(_value) {
		global.VOL_MASTER = _value;
	})
	.add_slider("Music Vol", 0, 1, .1, global.VOL_MSC, 32, function(_value) {
		global.VOL_MSC = _value;
	})
	.add_slider("SFX Vol", 0, 1, .1, global.VOL_SFX, 32, function(_value) {
		global.VOL_SFX = _value;
	})


menu = pause;

spd = 0.3;

