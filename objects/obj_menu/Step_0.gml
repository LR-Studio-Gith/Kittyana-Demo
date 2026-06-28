/// @desc Input Detection

// Get inputs
up_key = InputPressed(INPUT_VERB.UP)
down_key = InputPressed(INPUT_VERB.DOWN);
accept_key = InputPressed(INPUT_VERB.JUMP);

// Move through menu

if array_last(global.Active_Menus) == id {
	//show_debug_message(global.Active_Menus)
	
	pos += down_key - up_key; // Works because true and false are numbers, 1 & 0 

	pos = (pos + op_length()) % op_length(); // Loops the position from falling out of range
}
// Button highlighting
for (var i = 0; i < op_length(); ++i) {
	with button[i] {
		if (other.pos == i) 
		{
			event_perform(ev_mouse, ev_mouse_enter);
		} 
		else if (other.pos != i) 
		{
			event_perform(ev_mouse, ev_mouse_leave);
		}
	}
}

if accept_key and array_last(global.Active_Menus) == id {
	with button[pos] {
		event_perform(ev_mouse, ev_left_press);
	}
}