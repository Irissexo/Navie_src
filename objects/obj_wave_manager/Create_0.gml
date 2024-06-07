init = false;

curr_wave = 0;

enemies_num = 3;

global.points = 0;
global.target_points = enemies_num * 5;

enemy_adder = 1;
asteroid_timer = irandom_range(12, 30);
alarm[0] = asteroid_timer;

alarm[1] = 10;


wave_title_x = -240;
wave_title_y = 11;

xscl = 1;
yscl = 1;

can_pass = true;

squash = function(_x, _y) {
	xscl = _x;
	yscl = _y;
}

spawn_enemies = function() {
	var _enemies_arr = [
		obj_par_enemie,
		obj_ship_shoot,
	]
	
	repeat(enemies_num) {
		var x1 = -16;
		var x2 = room_width + 16;
		var y1 = -16;
		var y2 = room_height + 16;
	
		var yy = random_range(y1, y2);
		
		randomize()
		var _enemy = irandom_range(0, array_length(_enemies_arr) - 1);
	
		instance_create_depth(choose(x1, x2), yy, depth, _enemies_arr[_enemy])
	}
	
	
}

next_wave = function() {
	curr_wave += 1;
	enemies_num += enemy_adder;
	spawn_enemies()
	squash(1.5, 1.5)
		
}
