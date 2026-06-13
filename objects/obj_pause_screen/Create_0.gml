is_paused = false;
menu = noone;
menu_height = 0;
function pause_game() {
	obj_pause_manager.pause_tag("pauseable");
		
	if menu == noone {
		menu = create_menu(
		spr_menu, [
			obj_pause_resume, 
			obj_pause_options, 
			obj_pause_quit,
			obj_pause_mute,
		],
		0, 0, 40, 80
		) 
		// I can set the width/height to 0 since it literally doesn't matter
		// The thing will just resize itself 
		
		menu_height = menu.y
	}
	
	is_paused = true
}
function unpause_game() {
	obj_pause_manager.unpause_tag("pauseable");

	instance_destroy(menu.object_index)
	menu = noone
	
	is_paused = false
}