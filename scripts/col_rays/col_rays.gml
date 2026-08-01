/// future me hey dumbass spacing is only making shit taller not wider dumbass - sean


#region Floor
function col_ray_front(col = layer_tilemap_get_id("Collision"), _depth = 0) {
	var ray = collision_line(
		bbox_local_right() - sign(image_xscale), y,
		bbox_local_right() - sign(image_xscale), bbox_bottom + (1 + _depth),
		col,
		false,
		true
	)

	return ray
}
function col_ray_behind(col = layer_tilemap_get_id("Collision"), _depth = 0) {
	var ray = collision_line(
		bbox_local_left() + sign(image_xscale), y,
		bbox_local_left() + sign(image_xscale), bbox_bottom + (1 + _depth),
		col,
		false,
		true
	)

	return ray
}
#endregion

#region Wall
function wall_ray_front(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_center_x(), y,
		bbox_local_right() + sign(image_xscale), y,
		col,
		false,
		true
	)

	return ray
}

function wall_ray_back(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_center_x(), y,
		bbox_local_left() + sign(image_xscale), y,
		col,
		false,
		true
	)

	return ray
}
#endregion

#region Ceiling
function ceilray_f(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_local_right() - sign(image_xscale), y,
		bbox_local_right() - sign(image_xscale), bbox_top - 1,
		col,
		false,
		true
	)

	return ray
}
function ceilray_b(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_local_left() + sign(image_xscale), y,
		bbox_local_left() + sign(image_xscale), bbox_top - 1,
		col,
		false,
		true
	)

	return ray
}
#endregion
