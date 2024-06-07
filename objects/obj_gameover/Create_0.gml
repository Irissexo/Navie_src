pause = new Menu()
	.add_button("revive", function() {
		room_restart()
	})
	.add_button("quit", function() {
		//TransitionStart(rm_main_menu, sq_transic_in, sq_transic_out);
		trans_to(rm_main_menu)
	});


menu = pause;


