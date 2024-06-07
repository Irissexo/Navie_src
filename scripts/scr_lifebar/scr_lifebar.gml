// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function LifeBar(_hp_max) constructor {
	HP_max = _hp_max;
	HP = HP_max;
	
	static gain_pts = function(_amm) {
		HP += _amm;
		HP = clamp(HP, 0, HP_max);
	}
	
	static lose_points = function(_amm) {
		HP -= _amm;
		HP = clamp(HP, 0, HP_max);
	}
	
	static draw = function(_x, _y, _bc, _bgc, _bout) {
		var _bar_unit_px = 3;
		var _bar_height = 6;
		var _m = 2;
		
		var x1 = _x - _m;
		var x2 = _x + (HP_max * _bar_unit_px);
		var y1 = _y - _m;
		var y2 = _y + _bar_height;
		
		// drawing the bar outline
		draw_set_color(_bout);
		
		draw_rectangle(x1 - _m, y1 - _m, x2 + _m, y2 + _m, true)
		
		// drawing background
		draw_set_color(_bgc);		
		draw_rectangle(x1, y1, x2, y2, false)
		
		// drawing the bar itself
		draw_set_color(_bc);
		
		var _bar_x2 = x1 + (HP * _bar_unit_px);
		draw_rectangle(x1 + _m, y1 + _m, _bar_x2, y2 - _m, false)
				
		draw_set_color(c_white);
		
	}	
}