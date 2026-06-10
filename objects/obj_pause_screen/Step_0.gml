/* 
	asset_has_tags(..., "cutscene") prevents cutscenes from being paused, 
	Which looks weird and could break some things.
	Add the "unpauseable" tag if you create a new cutscene.
*/

if InputPressed(INPUT_VERB.PAUSE) and not asset_has_tags(room_get_name(room), "cutscene") {
	is_paused = !is_paused
	
	if is_paused == true {
		obj_pause_manager.pause_tag("pauseable")
		for (var i = 0; i < array_length(options); ++i) {
		    buttons[i] = create_button(window_get_width()/2, 
			( ( window_get_height()/2 ) - 90*i )+200,
			1, 1, options[i])
		}
		
	} else {
		obj_pause_manager.unpause_tag("pauseable")
		for (var i = 0; i <  array_length(buttons); ++i) {
		    instance_destroy(buttons[i].id)
		}
	}
}