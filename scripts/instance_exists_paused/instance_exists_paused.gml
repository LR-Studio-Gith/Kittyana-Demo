function instance_exists_paused(_obj_or_id){
	if instance_exists(_obj_or_id) return true;
	
	var _paused_elements = obj_pause_manager.paused_elements;
	for (var i = 0; i < array_length(_paused_elements); ++i) {
	   var _id = _paused_elements[i];
	   if (_id == _obj_or_id or _id.object_index = _obj_or_id) return true;
	}
	
	return false;
}