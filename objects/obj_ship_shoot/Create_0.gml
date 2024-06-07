/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

HP = HP_max;

can_shoot = 0;

bull_spd = 4;
bull = new bull_type();
bull_type_set_sprite(bull, spr_bullet, 0, 1);
bull_type_set_color(bull, c_red);
bull_type_set_damage(bull, 1);
bull_type_set_from_enemy(bull, true);

shoot = function() {
	bull_type_create(bull, x, y, ang, bull_spd);
	can_shoot = 30;
}

