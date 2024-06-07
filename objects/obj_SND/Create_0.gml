global.VOL_MSC		= .5;
global.VOL_SFX		= .2;
global.VOL_MASTER	= .1;

audio_controller = new AudioController("VOL_SFX", "VOL_MSC", "VOL_MASTER");

global.curr_song = noone;


#region // OST
global.ost = {
	main_arena : new AudioPlayLoop(
		snd_msc_arena,
		au_type_msc,
		1000
	),
	menu : new AudioPlayLoop(
		snd_msc_main_menu,
		au_type_msc,
		10000
	),
}

#endregion

#region // SFX
global.sfx = {
	combat : {
		player_death : new AudioPlaySingle(
			[
				snd_sfx_player_death
			],
			au_type_sfx
		),
		hit_hurt : new AudioPlaySingle(
			[
				snd_sfx_hurt,
				snd_sfx_hurt2,
			],
			au_type_sfx
		),
		shoot : new AudioPlaySingle(
			[
				snd_sfx_shoot,
			],
			au_type_sfx
		),
	},
}
#endregion
