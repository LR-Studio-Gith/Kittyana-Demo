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


draw_set_colour(c_green)
draw_line(
bbox_left, y,
bbox_left, bbox_bottom
)

draw_set_colour(c_red)
draw_line(
bbox_right, y,
bbox_right, bbox_bottom
)	 
