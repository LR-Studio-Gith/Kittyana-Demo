draw_self()



if state == ACTION_STATES.HOOKED
{
	var color = #633200
	draw_line_width_colour(x, y, hook_target_x, hook_target_y, 5, color, color)
} 

if alarm_get(3) != -1 
{
	draw_self_color(c_red, alarm_get(3)/max_hurt_time);
}

// Floor raycasts visuals
draw_set_colour(c_fuchsia)
draw_line(
bbox_local_right() - sign(image_xscale), y,
bbox_local_right() - sign(image_xscale), bbox_bottom+1
)

draw_set_colour(c_yellow)
draw_line(
bbox_local_left() + sign(image_xscale), y,
bbox_local_left() + sign(image_xscale), bbox_bottom+1
)	 

// Center of bounding box, kinda, doesn't matter really
draw_circle_colour(bbox_center_x(), y, 5, c_white, c_white,false)

// Side raycasts
draw_set_colour(c_lime)
//draw_rectangle(
//	bbox_local_right() - (-1*sign(image_xscale)), y,
//	bbox_local_left() +	(-1*sign(image_xscale)), bottom(),
//	true
//)
draw_line(
	bbox_center_x(), y,
	bbox_local_right() + sign(image_xscale), y
)