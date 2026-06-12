/* 
	asset_has_tags(..., "cutscene") prevents cutscenes from being paused, 
	Which looks weird and could break some things.
	Add the "unpauseable" tag if you create a new cutscene.
*/

if InputPressed(INPUT_VERB.PAUSE) and not asset_has_tags(room_get_name(room), "cutscene") {
	is_paused = !is_paused;
	
	if is_paused == true {
		obj_pause_manager.pause_tag("pauseable");
		
		if menu == noone {
			menu = create_menu(
			temp_button, [obj_pause_resume, obj_pause_options, obj_pause_quit],
			160, 280, 80, 160
			)
		}
		
	} else {
		obj_pause_manager.unpause_tag("pauseable");
		//layer_set_visible("PauseLayer", false);
		
		if menu != noone {
			instance_destroy(menu)
			menu = noone
		}
	}
}