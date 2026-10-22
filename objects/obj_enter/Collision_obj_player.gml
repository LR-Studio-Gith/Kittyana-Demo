if not instance_exists(obj_transition_manager) and InputPressed(INPUT_VERB.UP) {
	instance_create_depth(0, 0, 0,
	obj_transition_manager, 
	{target_room, target_exit})
}