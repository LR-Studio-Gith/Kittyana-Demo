

function col_ray_front(col = layer_tilemap_get_id("Collision"), spacing = 1) {
	var ray = collision_line(
		bbox_local_right() - sign(image_xscale), y,
		bbox_local_right() - sign(image_xscale), bbox_bottom+spacing,
		col,
		true,
		true
	)

	return ray
}
function col_ray_behind(col = layer_tilemap_get_id("Collision"), spacing = 1) {
	var ray = collision_line(
		bbox_local_left() + sign(image_xscale), y,
		bbox_local_left() + sign(image_xscale), bbox_bottom+spacing,
		col,
		true,
		true
	)

	return ray
}

function wall_ray_front(col = layer_tilemap_get_id("Collision"), spacing = 0) {
	var ray = collision_line(
		bbox_center_x(), y,
		bbox_local_right() + sign(image_xscale), y+spacing,
		col,
		true,
		true
	)

	return ray
}