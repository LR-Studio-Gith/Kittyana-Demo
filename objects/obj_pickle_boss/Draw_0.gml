// Inherit the parent event
event_inherited();

draw_set_colour(c_blue)
draw_line(
	bbox_center_x(), y,
	bbox_local_right() + sign(image_xscale), y
)

//draw_line(
//	bbox_center_x(), y,
//	bbox_local_left() + sign(image_xscale), y
//)