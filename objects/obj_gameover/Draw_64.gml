var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

draw_set_alpha(.5);
draw_rectangle_color(0, 0, _guiw, _guih, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);

draw_sprite(spr_title_gameover, 0, _guiw/2, _guih/2 - 16 + wave(-.5, .5, 1, 0))

var _down = keyboard_check_pressed(ord("S"));
var _up = keyboard_check_pressed(ord("W"));

var _sel = keyboard_check_pressed(ord("E"));

menu.draw(_guiw/2, _guih/2 + 8, 16);
menu.scroll(_down - _up, true)

if _sel {
	menu.select();
}

