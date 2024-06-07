main = new Menu()
	.add_button("play", function() {
		trans_to(rm_arena)
		unpause_game()
	})
	.add_button("options", function() {
		menu = opt;
	})
	.add_button("exit", function() {
		game_end()
	})


opt = new Menu()
	.add_button("back", function() {
		menu = main;
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

menu = main;


