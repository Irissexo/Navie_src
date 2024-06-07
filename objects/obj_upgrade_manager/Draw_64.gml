var mx = mouse_x
var my = mouse_y;

var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

draw_set_alpha(.4)
draw_rectangle_color(
	0, 0,
	_guiw, _guih,
	c_black,
	c_black,
	c_black,
	c_black,
	false	
)
draw_set_alpha(1)

draw_set_font(fnt_monogram_italic);
draw_set_halign(fa_center)
draw_text_wave(_guiw/2, draw_posy - 24, "Select Your Build", string_width("Select Your Build"), .5)

draw_set_halign(fa_left)


draw_posy = lerp(draw_posy, draw_posy_mid + wave(.2, 2, 2, 0), .1);

for (var up = 0; up < array_length(upgrades); up++) {
	var _spr = spr_specials;
	var _img = upgrades[up].frame;
	
	var _sprw = sprite_get_width(_spr);
	
	// calculate the sprite x pos
	var _xx;
	var _mm = 4;
		
	//var _ww = ((_guiw - _sprw * array_length(upgrades))/2 - _mm) * up
	_xx = _guiw/2 - (_sprw * array_length(upgrades))/2 + ((_sprw + _mm) * up)
	
	var _hover = point_in_circle(
		mx, my, 
		_xx, draw_posy,
		8
	)
	
	
	if _hover {		
		draw_sprite_ext(_spr, _img, _xx, draw_posy, 1.5, 1.5, 0, c_white, 1);	
		var _nm = upgrades[up].name;
		var _desc = upgrades[up].desc;
		
		draw_set_halign(fa_center);
		draw_text(_guiw/2, draw_posy + 30, _nm);
		draw_text_ext(_guiw/2, draw_posy + 42, _desc, 12, 180);
		
		if mouse_check_button_pressed(mb_left) {		
			
			array_push(global.player_upgrades, upgrades[up])
			
			unpause_game()	
				
			with obj_player {
				switch other.upgrades[up].type {
					case SPECIAL:
						special = other.upgrades[up];
						ammo = ammo_max;
					break;
					
					case UPGRADE:
						other.upgrades[up].func();
					break;
				}
			}
			
			instance_destroy()
		}
		
	} else {		
		draw_sprite_ext(_spr, _img, _xx, draw_posy, 1, 1, 0, c_white, .7);
	}
	
}

draw_set_halign(fa_left);
draw_set_font(-1);
