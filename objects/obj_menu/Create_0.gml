/// @desc Settings
//width = 64; // both in pixels
//height = 128;
//border_margin = 8; // also in pixels
//line_spacing = 16; 

// Set buttons
//button = [];
pos = 0;
show_debug_message(button)
// Get the amount of button options
function op_length() {return array_length(button);}

// Create buttons
for (var i = 0; i < op_length(); ++i) {
	/*
		For every button inside that list, create one of them
		
		line_spacing*i spaces the buttons out in pixels
	*/
	
    var _inst = instance_create_depth(
	x, y + line_spacing*i, // Spaces out the buttons
	depth-1, 
	button[i])
}

// Get the longest button
function get_longest_button_width() 
{
	var _new_w = 0
	for (var i = 0; i < op_length(); ++i) {
	    var _op_w = string_width(button[i].button_text);
		_new_w = max(_new_w, _op_w);
	}
	return _new_w;
}

// Update button's positions
function update_button_position() 
{
	if (x != xprevious) return; // Early exit
	
	for (var i = 0; i < op_length(); ++i) {
		button[i].x = x;
		button[i].y = y + line_spacing*i;
	}
}