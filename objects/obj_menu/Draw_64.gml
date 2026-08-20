/// @desc Draw Background
// Dynamically adjust width and height
width = get_longest_button_width() + border_margin*2;
height = border_margin*2 + string_height(any_button().button_text) + (op_length()-1)*line_spacing;
/*
border_margin*2					for the top and bottom
string_height(button[0].text)	for how tall our text is
(op_length()-1)*line_spacing	accounts for the spacing of the buttons
*/ 

// Center menu
x = window_get_width()/2 - width/2;
if stay_centered {
	y = window_get_height()/2 - height/2;
}

update_button_position();

// Draw menu background
if menu_sprite != noone {
	draw_sprite_ext(
		menu_sprite, -1, 
		x, y,
		width/sprite_width, // Allows us to scale the sprite by pixels, basically
		height/sprite_width,
		0, c_white, 1
	);
}
