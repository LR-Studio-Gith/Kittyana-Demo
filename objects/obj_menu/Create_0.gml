/// @desc Setup & Functions
pos = 0;
sprite_index = menu_sprite

// Get the amount of button options
// Create buttons
for (var i = 0; i < op_length(); ++i) {
	/*
		For every button inside that list, create one of them
		
		line_spacing*i spaces the buttons out in pixels
	*/
	
    var _inst = instance_create_depth(
	x+border_margin, (y+border_margin) + line_spacing*i, // Spaces out the buttons
	depth-1, 
	button[i])
}

function op_length() {return array_length(button);}

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
		button[i].x = self.x + border_margin
		button[i].y = (self.y + border_margin) + line_spacing*i;
	}
}
