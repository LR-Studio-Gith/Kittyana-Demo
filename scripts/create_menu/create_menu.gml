/// @desc Creates a menu.
/// @arg {Asset.GMSprite} _sprite The nine-slice sprite to use as the background of the menu.
/// @arg {Array<Asset.GMObject>} _buttons An array of button objects to use for the menu.
/// @arg {Real} _width The width of the menu, it's mininum size automatically adjusts to the length of the button.
/// @arg {Real} _height The height of the menu, similar functionality to the width.
/// @arg {Real} _margins The spacing between the menu and the button inside it.
/// @arg {Real} _line_spacing The spacing between each button
/// @return {Asset.GMObject} The menu created afterwards
function create_menu(_sprite, _buttons, _width, _height, _margins, _line_spacing){
	var _menu = instance_create_depth(
	camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2, // centering
	camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2, 
	depth-1, 
	obj_menu, {
		menu_sprite : _sprite,
		button : _buttons,
		width : _width,
		height : _height,
		border_margin : _margins,
		line_spacing : _line_spacing,
	});
	
	return _menu
}