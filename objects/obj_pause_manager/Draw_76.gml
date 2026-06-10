/// @desc First Event in a Frame

// This is in Pre-Draw because this will be the
// Very first thing to happen in a frame

// For every element inside the paused elements array, 
// Reactivate them
for (var i = 0; i < array_length(paused_elements); ++i) {
	instance_activate_object(paused_elements[i])
	
}