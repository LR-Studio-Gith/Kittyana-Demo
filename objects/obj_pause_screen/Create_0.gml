menu = noone;
menu_height = 0;
is_open = false;

if not audio_group_is_loaded(audiogroup_sfx) {
	audio_group_load(audiogroup_sfx)
}

function open_pause_menu() 
{
	is_open = true;
	pause();
	
	if menu == noone {
		menu = create_menu(
		spr_menu, [
			obj_pause_resume, 
			obj_pause_restart,
			obj_pause_options, 
			obj_pause_quit,
		],
		0, 0, 40, 80
		).id
		// I can set the width/height to 0 since it literally doesn't matter
		// The thing will just resize itself 
		
		menu_height = menu.y
	}
	
	audio_play_sound(snd_pause_sfx, 1, false)
}

function close_pause_menu() 
{
	is_open = false;
	unpause();
	
	if instance_exists(menu) {
		instance_destroy(menu)
	}
	menu = noone
}