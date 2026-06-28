if is_being_dragged {
	var _device = InputPlayerGetDevice();
	if InputDeviceIsGamepad(_device) {
		amount_current += -InputX(INPUT_CLUSTER.NAVIGATION)
		amount_current = clamp(amount_current, 0, amount_max)
	} else {
		var _xx = window_mouse_get_x()
		//show_debug_message("--using mouse--")
		//show_debug_message("mouse x: " + string(_xx))
		//show_debug_message("sprite's x: " + string(x))
		if _xx > x {
			var xx = abs(x - _xx); // gonna have some issues w/ gui scaling
			var amount = xx / sprite_width // 0-1
			amount = clamp(amount, 0, 1);
			amount_current = amount * 100
		} else {
			amount_current = 0;
		}
	}
}

