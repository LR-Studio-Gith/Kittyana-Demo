///@ignore

// I just copied this from Refresh there's no time left for me
function __TimesourceFunction() {
    // To begin with, we set the scope to the modifier tracker
    with (global.__modifier_tracker) {
         
        // Now we'll first check the size of the modifiers array, to see it it's at 0
        var _modifiers_size = array_length(modifiers);
        if (_modifiers_size <= 0) {
            // If there are no modifiers currently being tracked, then we don't need to keep the timesource running, so we'll pause it
            var _state = time_source_get_state(timesource);
            if (_state != time_source_state_paused) {
                time_source_pause(timesource);
            }
            // And then exit out of the function, seeing as there are no modifiers to loop through
            exit;
        }
         
        // If there are some modifiers, we'll start looping through them, remembering to start at the END of the array and looping backwards to the start, as we might be deleting positions in the array, which will lead to bugs if we loop from the start to the end
        for (var i = _modifiers_size - 1; i >= 0; i--) {
            var _mod = modifiers[i];
             
            // Here we check to see if the modifiers duration is less than or equal to 0, and then decrement the duration by one (using the double negative -- symbols)
            if (_mod.duration-- <= 0) {
                // If it is, we need to remove it from whatever stat is has been applied to, so we set the scope to that state
                with (_mod.applied_stat) {
                    // And run the RemoveModifierById function in that stat
                    RemoveModifierById(_mod);
                }
                // Then we delete the Modifier struct
                delete _mod;
                // And remove it from the modifier trackers array
                array_delete(modifiers, i, 1);
            }
        }
    }
}

// Here we'll setup the global timesource that the modifier tracker will use, telling it to run the __TimesourceFunction every frame, and repeat indefinitely
__modifier_tracker_timesource = time_source_create(time_source_game, 1, time_source_units_frames, __TimesourceFunction, [], -1);
// And now we start the timesource
time_source_start(__modifier_tracker_timesource);
 
__modifier_tracker = {
    // We want an array to keep track of the modifiers with duration
    modifiers : [],
     
    /* We'll just store a reference to the global tracker timesource in 
	* the __modifier_tracker struct, this is not strictly necessary, 
	* but I think it's a little neater this way
	*/
    timesource : global.__modifier_tracker_timesource,
     
    // And we'll make the function that allows us to add modifiers to the modifier tracker
    AddModifier : function(_mod) {
        // First we push the Modifier to the trackers array
        array_push(modifiers, _mod);
         
        /* Then we need to check the state of the timesource, 
		* as our __TimesourceFunction() can pause the timesource, 
		* and if it's paused AND we are adding a new modifier to be tracked, 
		* we want to unpause the timesource so it starts running again
		*/
        var _timesource_state = time_source_get_state(timesource);
        if (_timesource_state == time_source_state_paused) {
            time_source_resume(timesource);
        }
    }
}