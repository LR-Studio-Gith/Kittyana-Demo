/// @desc Last Event in a Frame

// This is inside the Draw GUI End event since this
// Will be the last event to ever happen in a frame

// Put all elements inside the pause queue into the 
// Paused elements array
for (var i = 0; i < array_length(pause_queue); ++i) {
    with pause_queue[i] {
		array_push(other.paused_elements, id);
	}
}

// Once all elements have been catalogged into the 
// paused elements array, clear the queue
pause_queue = [];

// When unpausing take all the elements out
for (var i = 0; i < array_length(unpause_queue); ++i) {
    with unpause_queue[i] {
		var _index = array_get_index(other.paused_elements, id);
		if _index != -1 {
			array_delete(other.paused_elements, _index, 1);
		}
	}
}

// And then clear the unpaused queue
unpause_queue = [];

// For every element inside the paused elements array, 
// Deactivate them/"pause" them
for (var i = 0; i < array_length(paused_elements); ++i) {
    instance_deactivate_object(paused_elements[i]);
}