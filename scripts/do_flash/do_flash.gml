/**
*Causes the object's sprite to flash a color for a settable amount of time.
To set the color use the function set_flash_shader_color() in the Create Event
Setting the time higher than 1 will just make it retain a solid color until it reaches 1, then it'll start fading
 * @param {Real} [seconds]=1 | Time in seconds the effect lasts
 */
function do_flash(seconds=1)
{
	// jank but im tired
	set_flash_shader_color.flash_time = clamp(seconds, 0, infinity)
	var _time = set_flash_shader_color.flash_time
	static is_flashing = false;
	if (not is_flashing and _time <= 0)
	{
		is_flashing = true;
		_time = seconds;
		
	} else if (is_flashing and _time <= 0){
		is_flashing = false;
	}
}
