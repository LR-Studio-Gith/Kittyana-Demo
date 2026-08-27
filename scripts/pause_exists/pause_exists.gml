/// @desc Checks for if the pause system exists in a room, re-creates it if not
function pause_exists(){
	if !instance_exists(obj_pause_manager) {
		show_debug_message("Pause Manager absent, creating new one...")
		instance_create_depth(x, y, depth, obj_pause_manager)
	} 
	
	if !instance_exists(obj_pause_screen) {
		show_debug_message("Pause screen overlay absent, creating new one...")
		instance_create_depth(x, y, depth, obj_pause_screen)
	} 
}