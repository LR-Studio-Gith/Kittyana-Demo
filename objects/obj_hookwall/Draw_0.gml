draw_self()
if point_distance(x+sprite_width/2, y+sprite_height/2, obj_player.x, obj_player.y) <= obj_player.hook_max_dist {
	draw_self_color(c_white, 0.5)
}