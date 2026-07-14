function free_aim(){
	var _x = 0; var _y = 0;
	
	var _device = InputPlayerGetDevice()
	if InputDeviceIsGamepad(_device) { // Joystick
		_x = InputX(INPUT_CLUSTER.JOYSTICK_AIM); // -1 to 1
		_y = InputY(INPUT_CLUSTER.JOYSTICK_AIM);
	}
	else {
		var _dir = point_direction(x, y, mouse_x, mouse_y)
		_x = dcos(_dir)
		_y = -dsin(_dir)
	}
	
	return {
		x : _x,
		y :	_y, 
	}
}