
///@desc Creates a modifier struct that can be applied to a statistic
///@param {Real} _value The value of the modifier
///@param {Real} _math_operation How the value should be applied to the statistic (should be a math_ops enum)
///@param {Real} _duration How long the modifier should last for, leave the argument blank for permanent modifiers. S- Time is in seconds 
function Modifier(_value, _math_operation, _duration = -1) constructor {
    value = _value;
    operation = _math_operation;
    duration = _duration*game_get_speed(gamespeed_fps);
    // By keeping track of the maximum length of the duration, we can compare it to the duration and figure out what percentage of the duration has been completed, useful if we want to display some sort of indicator for the duration left
    duration_max = _duration*game_get_speed(gamespeed_fps);
    applied_stat = noone;
     
    if (duration > 0) {
        // If the modifier has a duration, we want to add it to the modifier tracker so it can be counted down and removed when it's duration is up
        global.__modifier_tracker.AddModifier(self);
    }
}