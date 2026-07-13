draw_self()

if state == ACTION_STATES.HOOKED {
	var color = #633200
	draw_line_width_colour(x, y, hook_target_x, hook_target_y, 5, color, color)
} 

if alarm_get(3) != -1 { // -1 = alarm has stopped
	draw_self_color(c_red, alarm_get(3)/max_hurt_time);
}

draw_set_colour(c_green)
draw_circle(free_aim().x, free_aim().y, 5, false)
