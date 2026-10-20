if image_index = 1 and InputPressed(INPUT_VERB.UP) {
	if room_location != noone {
		room_goto(room_location)
	} else {
		show_debug_message(".")
		show_debug_message("you'd entered this building... if there was a room here")
		show_debug_message(".")
	}
}