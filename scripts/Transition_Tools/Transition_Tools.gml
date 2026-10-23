global.mid_transition = false;
global.room_target = noone;
global.transition_cd = 0;

function TransitionPlaceSequence(_type) {
	if layer_exists("transition") {layer_destroy("transition");}
	
	var _layer = layer_create(-9999, "transition");
	layer_sequence_create(_layer, 0, 0, _type);
}

function TransitionStart(_room_target, _typeOut, _typeIn) {
	if not global.mid_transition and global.transition_cd <= 0 {
		global.mid_transition = true;
		global.room_target = _room_target;
		
		pause();
		TransitionPlaceSequence(_typeOut);
		layer_set_target_room(_room_target);
		TransitionPlaceSequence(_typeIn);
		
		layer_reset_target_room();
		
	} else return false;
}

function TransitionChangeRoom() {room_goto(global.room_target)}

function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	global.mid_transition = false;
	global.room_target = noone;
	global.transition_cd = 0.1;
	unpause();
}