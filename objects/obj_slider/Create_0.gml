cursor = window_get_cursor();
amount_max = 100;
is_being_dragged = false;
_color = text_color
selected = false;

function total_width() {
	return string_width(slider_text) + sprite_width + string_width("999") + padding*2 // <-- num w/ biggest size
	// Text + slider itself + Percentage
}
function total_height() { 
	return max(sprite_get_height(knob_sprite), string_height(slider_text)); // <-- which ever is bigger
}
