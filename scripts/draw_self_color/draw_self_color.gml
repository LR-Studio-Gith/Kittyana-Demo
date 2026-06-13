///@description draw self with a given color overlaying
///@param color_overlay
///@param color_overlay_alpha
function draw_self_color() {

	return draw_sprite_ext_color( sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_alpha, argument[0], argument[1]);


}
