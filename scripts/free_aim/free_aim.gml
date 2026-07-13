function free_aim(){
	var _x = 0; var _y = 0;
	
	var _device = InputPlayerGetDevice()
	if InputDeviceIsGamepad(_device) {
		_x = InputX(INPUT_CLUSTER.JOYSTICK_AIM);
		_y = InputY(INPUT_CLUSTER.JOYSTICK_AIM);
	}
	//else {
	//	_x = mouse_x;
	//	_y = mouse_y;
	//}
	
	//show_debug_message("x: " + string(_x))
	//show_debug_message("y: " + string(_y))
	
	return {
		x : _x,
		y :	_y, 
	}
}