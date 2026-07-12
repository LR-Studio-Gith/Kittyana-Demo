

function col_ray_front(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_local_right() - sign(image_xscale), y,
		bbox_local_right() - sign(image_xscale), bbox_bottom+1,
		col,
		true,
		true
	)

	return ray
}
function col_ray_behind(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_local_left() + sign(image_xscale), y,
		bbox_local_left() + sign(image_xscale), bbox_bottom+1,
		col,
		true,
		true
	)

	return ray
}

function wall_ray_front(col = layer_tilemap_get_id("Collision")) {
	var ray = collision_line(
		bbox_center_x(), y,
		bbox_local_right() + sign(image_xscale), y,
		col,
		true,
		true
	)

	return ray
}