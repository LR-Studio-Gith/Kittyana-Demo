/* 
	asset_has_tags(..., "cutscene") prevents cutscenes from being paused, 
	Which looks weird and could break some things.
	Add the "unpauseable" tag if you create a new cutscene.
*/

if InputPressed(INPUT_VERB.PAUSE) and not asset_has_tags(room_get_name(room), "cutscene") {
	is_paused = !is_paused
	
	if is_paused == true {
		obj_pause_manager.pause_tag("pauseable")
	} else {
		obj_pause_manager.unpause_tag("pauseable")
	}
}