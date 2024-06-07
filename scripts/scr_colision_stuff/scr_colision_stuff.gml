function collide(_col) {
	var _subpixel = .5;
	
	if place_meeting(x + hspd, y, _col) {
		var _pixel_check = _subpixel * sign(hspd);
		
		while !place_meeting(x + _pixel_check, y, _col) {
			x += _pixel_check
		}
		
		hspd = 0;	
	}
	
	x += hspd;
	
	if place_meeting(x, y + vspd, _col) {
		var _pixel_check = _subpixel * sign(vspd);
		
		while !place_meeting(x, y + _pixel_check, _col) {
			y += _pixel_check
		}
		
		vspd = 0;
	}
	
	
	y += vspd;
	
	
}