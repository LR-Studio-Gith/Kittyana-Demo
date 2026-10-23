/* 
	asset_has_tags(..., "cutscene") prevents cutscenes from being paused, 
	Which looks weird and could break some things.
	Add the "unpauseable" tag if you create a new cutscene.
*/

if InputPressed(INPUT_VERB.PAUSE) 
and not asset_has_tags(room_get_name(room), "cutscene")
and not global.mid_transition {
	if global.is_paused == false {open_pause_menu();} 
	else {close_pause_menu();}
}

// This shouldn't be done inside of here but its late
// they should be updated when the setting is finished updating
update_settings();