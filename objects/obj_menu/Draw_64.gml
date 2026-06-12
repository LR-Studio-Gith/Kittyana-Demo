/// @desc Draw Background

// Dynamically adjust width and height
width = get_longest_button_width() + border_margin*2;
height = border_margin*2 + string_height(button[0].button_text) + (op_length()-1)*line_spacing;
/*
border_margin*2					for the top and bottom
string_height(button[0].text)	for how tall our text is
(op_length()-1)*line_spacing	accounts for the spacing of the buttons
*/ 

// Center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

update_button_position();

// Draw menu background

draw_sprite_ext(
	sprite_index, -1, 
	x, y,
	width/sprite_width, // Allows us to scale the sprite by pixels, basically
	height/sprite_width,
	0, c_white, 1
);