draw_self()

if alarm_get(3) != -1 {
	draw_self_color(c_red, alarm_get(3)/max_hurt_time);
}