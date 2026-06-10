draw_self()

/* Flash Effect */
//update_flash()

if state == ACTION_STATES.HOOKED{
	var color = #633200
	draw_line_width_colour(x, y, hook_target_x, hook_target_y, 5, color, color)
} 