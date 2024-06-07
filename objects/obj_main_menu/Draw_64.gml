var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

draw_set_alpha(.5);
draw_rectangle_color(0, 0, _guiw, _guih, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);


var _down = keyboard_check_pressed(ord("S"));
var _up = keyboard_check_pressed(ord("W"));
var _right = keyboard_check_pressed(ord("D"));
var _left = keyboard_check_pressed(ord("A"));

var _sel = keyboard_check_pressed(ord("E"));

switch menu {
	case main:	
		draw_sprite(spr_title_main, 0, _guiw/2, 32 + wave(-1, 1, 4, 0))
		menu.draw(_guiw/2, _guih/2 + 8, 16);
	break;
	case opt:
		menu.draw(_guiw/4, _guih/2, 16);
	break;
}

menu.scroll(_down - _up, true)
menu.changeValue(_right - _left);

if _sel {
	menu.select();
}

