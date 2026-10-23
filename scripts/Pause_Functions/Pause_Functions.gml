function pause(){
	if global.is_paused == false {
		obj_pause_manager.pause_tag("pauseable");
		global.is_paused = true
		show_debug_message("Game is Paused")
	} else {show_debug_message("Game is already paused")}
}

function unpause() {
	if global.is_paused == true {
		obj_pause_manager.unpause_tag("pauseable");
		global.is_paused = false
		show_debug_message("Game has been Unpaused")
	}  else {show_debug_message("Game is not currently paused")}
}