if HP <= 0 {
	instance_destroy();
}

ang += 0.1;
if can_hurt > 0 {can_hurt--;}

x += hspd;
y += vspd;

