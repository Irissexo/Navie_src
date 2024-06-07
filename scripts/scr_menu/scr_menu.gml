function Menu() constructor {
    position = 0;
    elements = [];
    length = 0;

    scroll = function(_direction, _wrap = false) {
        position += _direction;
        if (_wrap) {
            position = position - floor(position / length) * length;
        }
        else {
            position = clamp(position, 0, length - 1);
        }
    }

    changeValue = function(_amount) {
        if (_amount != 0) {
            elements[position].changeValue(_amount);
            elements[position].onValueChange(elements[position].value);
        }
    }

    select = function() {
        elements[position].onSelect();
    }

    add_button = function(_text = "", _onSelect) {
        array_push(elements, new MenuButton(_text, _onSelect));
        length = array_length(elements);
        return self;
    }

    add_slider = function(_text = "", _minimum = 0, _maximum = 10, _interval = 1, _start = _minimum, _width = 100, _onValueChange) {
        array_push(elements, new MenuSlider(_text, _minimum, _maximum, _interval, _start, _width, _onValueChange));
        length = array_length(elements);
        return self;
    }

    add_carousel = function(_text = "", _options = [], _start = 0, _onValueChange) {
        array_push(elements, new MenuCarousel(_text, _options, _start, _onValueChange));
        length = array_length(elements);
        return self;
    }

    draw = function(_x, _y, _spacing) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
		
		draw_set_font(fnt_monogram_normal);
		
        for (var i = 0; i < length; i++) {			
            elements[i].draw(_x, _y + _spacing * i, i == position);
        }

		draw_set_font(-1);

    }
}

function __MenuElement(_onSelect = function() { }, _onValueChange = function() { }) constructor {
    onSelect = _onSelect;

    value = 0;
    changeValue = function() { };
    onValueChange = _onValueChange;
}


function MenuButton(_text = "", _onSelect) : __MenuElement(_onSelect) constructor {
    text = _text;

    draw = function(_x, _y, _isSelected) {
		var x1 = _x - 32,
			y1 = _y - string_height(text)/2,
			x2 = _x + 32,
			y2 = _y + string_height(text)/2;
			
		if _isSelected {			
			draw_rectangle_color(x1, y1, x2, y2, c_yellow, c_yellow, c_yellow, c_yellow, 0);
		}
		
        draw_set_color(_isSelected ? c_black : c_white);
        draw_text(_x, _y, text);
		draw_set_color(c_white);
    }
}

function MenuSlider(_text = "", _minimum = 0, _maximum = 10, _interval = 1, _start = _minimum, _width = 100, _onValueChange = function() { }) : __MenuElement(undefined, _onValueChange) constructor {
    text = _text + ":";

    minimum = _minimum;
    maximum = _maximum;
    interval = _interval;

    value = _start;

    width = _width;

    changeValue = function(_amount) {
        value = clamp(value + _amount * interval, minimum, maximum);
    }

    onValueChange = _onValueChange;

    draw = function(_x, _y, _isSelected) {
        static spacing = 2;

        draw_set_color(_isSelected ? c_yellow : c_white);
        draw_text(_x, _y, text);

        _x += (string_width(text) + spacing);

        draw_line(_x, _y, _x + width, _y);

        var pos = lerp(_x, _x + width, (value - minimum) / (maximum - minimum));
        draw_circle(pos, _y, 2, 0);
    }
}

function MenuCarousel(_text = "", _options = [], _start = 0, _onValueChange) : __MenuElement(undefined, _onValueChange) constructor {
    text = _text + ":";
    options = _options;
    value = _start;

    changeValue = function(_amount) {
        value = clamp(value + _amount, 0, array_length(options) - 1);
    }

    onValueChange = _onValueChange;

    draw = function(_x, _y, _isSelected) {
        static spacing = 2;

        draw_set_color(_isSelected ? c_yellow : c_white);
        draw_text(_x, _y, text);

        _x += string_width(text) + spacing;

        for (var i = 0; i < array_length(options); i++) {
            var str = options[i];
            draw_text(_x, _y, str);

            if (i == value)
                draw_text(_x - (string_width(str)/2 + 6), _y, ">");
            _x += string_width(str) + spacing;
        }
    }
}

