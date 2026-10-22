if instance_exists(obj_player) and instance_exists(target_exit) {
	obj_player.x = target_exit.x;
	obj_player.y = target_exit.y;
}
instance_destroy();