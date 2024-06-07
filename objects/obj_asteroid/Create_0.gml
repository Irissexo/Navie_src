randomize()

HP_max = irandom_range(4, 8);
HP = HP_max;

dir = point_direction(x, y, room_width/2, room_height/2) + random_range(-32, 32)
spd = 0.3

hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

can_hurt = 0;

alarm[0] = 100;
can_despawn = false;

ang = 0;