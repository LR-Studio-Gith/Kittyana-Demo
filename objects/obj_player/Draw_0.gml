draw_self()

if state == ACTION_STATES.HOOKED {
	var color = #633200
	draw_line_width_colour(x, y, hook_target_x, hook_target_y, 5, color, color)
} 

if alarm_get(3) != -1 { // -1 = alarm has stopped
	draw_self_color(c_red, alarm_get(3)/max_hurt_time);
}

draw_set_colour(c_white)
draw_circle(
	x, y,
	grab_rad_max,

	true
)

draw_set_colour(c_blue)
draw_circle(
	x, y,
	grab_rad_min,

	true
)