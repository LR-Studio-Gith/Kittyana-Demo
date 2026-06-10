/// @desc Setup

paused_elements = [];

pause_queue = [];
unpause_queue = [];

pause_object = function(_obj_or_id) {
	array_push(pause_queue, _obj_or_id);
}

unpause_object = function(_obj_or_id) {
	array_push(unpause_queue, _obj_or_id);	
}

pause_tag = function(_tag_or_tags){
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object)
	for (var i = 0; i < array_length(_assets); ++i) {
	    pause_object(_assets[i])
	}
}

unpause_tag = function(_tag_or_tags){
	var _assets = tag_get_asset_ids(_tag_or_tags, asset_object)
	for (var i = 0; i < array_length(_assets); ++i) {
	    unpause_object(_assets[i])
	}
}