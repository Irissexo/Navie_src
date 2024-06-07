if global.points >= global.target_points {
	show_upgrade_screen();
	
	global.target_points += curr_wave + (enemies_num * 5);
	global.points = 0;
}


