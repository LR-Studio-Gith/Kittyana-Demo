/// @desc Setup & Functions
pos = 0;
sprite_index = menu_sprite
array_push(global.Active_Menus, id)



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
		if asset_has_tags(button[i].object_index, "slider") or
		asset_has_tags(object_get_parent(button[i].object_index), "slider")
		{ // If dealing with a slider object
			// If its a slider than the width has to be specially calculated
			var _op_w = button[i].total_width()
			// Luckily the slider does it for us
		} else { // Run normal calculations otherwise
			var _op_w = string_width(button[i].button_text);
		}
		_new_w = max(_new_w, _op_w);
	}
	return _new_w;
}

// Update button's positions
function update_button_position() 
{
	if (x != xprevious) return; // Early exit
	
	for (var i = 0; i < op_length(); ++i) {
		if asset_has_tags(button[i].object_index, "slider") { // Slider
			button[i].x = self.x + border_margin + string_width(button[i].slider_text) + button[i].padding;
			button[i].y = (self.y + border_margin) + button[i].total_height()/2 + line_spacing*i ;
		} else { // Regular options
			button[i].x = self.x + border_margin;
			button[i].y = (self.y + border_margin) + line_spacing*i;
		}
	}
}

function any_button() {
for (var i = 0; i < op_length(); ++i) {
		if not asset_has_tags(button[i].object_index, "slider") {
			return button[i]
		}
	}
}