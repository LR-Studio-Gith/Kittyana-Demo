// Thank you RefresherTowel, I was completely stumped you made stats really understandable 
// The code is pretty much verbatim from their's so I can't take credit -S < i need a new nick

enum math_ops {
    ADD,
    MULTIPLY,
	FLAT,
}
 
///@desc Creates a statistic, assigning it a value (or 0 if no value is provided)
///@param {Real} _value The initial number to set value to
function Statistic(_value) constructor {
    base_value = _value;
    current_value = _value;
    modifiers = [];
    altered = false;
  
    static AddModifier = function(_mod) {
        // First we shove the Modifier into the modifiers array
        array_push(modifiers, _mod);
        // Now, we assign the applied_stat field of the Modifier to the Statistic it is being given to
        _mod.applied_stat = self;
        // Whenever we add a new Modifier, we set altered to true, so that we know we have to recalculate the current_value
        altered = true;
    }
     
    static RemoveModifierById = function(_mod_id) {
        // Since we'll be deleting something from the modifiers array, it's important to loop backwards (not strictly necessary in this case, as we are returning immediately after deletion, but it's important to build the habit)
        for (var i = array_length(modifiers) - 1; i >= 0; i--) {
            // Retrieve the modifier from the array
            var _mod = modifiers[i];
             
            // If our supplied _mod_id is the same as the mod that was retrieved, we can remove it from the array
            if (_mod == _mod_id) {
                array_delete(modifiers, i, 1);
                // Remember to set altered to true, as we've changed what's modifying the statistic
                altered = true;
                // And we'll return true so that we can find out if the removal was successful or not, if we'd like to know that
                return true;
            }
        }
        // If we didn't find the modifier, we'll return false
        return false;
    }
     
    static RemoveModifierByPosition = function(_pos) {
        // Basically the same as removing the modifier by id, except we just need to check whether the position being supplied is within the bounds of the array
        if (_pos < array_length(modifiers)) {
            // If so, delete, set altered to true and return true
            array_delete(modifiers, _pos, 1);
            altered = true;
            return true;
        }
        // Otherwise return false
        return false;
    }
 
    static GetValue = function() {
        // If we haven't added any modifiers since the value was last retrieved, we can simply return the current value
        if (!altered) return current_value;
    
        // Otherwise, we have to recalculate the current value, starting with the base value and going through all the modifiers, applying their operation, and then setting current value to the result
 
        // First we get the base value of the stat
        var _value = base_value;
 
        // Then we start looping through the modifiers
        for (var i = 0, _num = array_length(modifiers); i < _num; i++) {
            // We retrieve the current modifier
            var _mod = modifiers[i];
       
            // And then we want to check what operation that modifier wants to do, so we'll use a switch statement
            switch (_mod.operation) {
                case math_ops.ADD:
                    // If the modifier holds an ADD math_ops enum, we simply add the value to our temporary _value variable
                    _value += _mod.value;
                break;
                case math_ops.MULTIPLY:
                    // Otherwise if it holds a MULTIPLY math_ops enum, we want to multiply the temporary value by that amount.
                    _value *= 1 + _mod.value;
                    // Here, I'm choosing to already add 1 to the modifiers value, which allows us to make the value 0.5 if we want to add 50%, and -0.5 if we want to subtract 50%. Without the 1 added here, then adding 50% would need a value of 1.5 and subtracting 50% would need a value of 0.5. I like the symmetry of 0.5 and -0.5 versus 1.5 and 0.5, so that's why I do it this way. 
                break;
				case math_ops.FLAT:
					// this is something I added myself, it sets the value directly -S
					_value = _mod.value;
				break;
            }
        }
     
        // We've done all the needed calculations on _value now, so we set current_value to _value.
        current_value = _value;
        // We set altered back to false, as we know that current_value is up to date right now, so we don't need to repeat the calculation until another modifier gets added.
        altered = false;
        // And we return current_value
        return current_value;
    }
}
