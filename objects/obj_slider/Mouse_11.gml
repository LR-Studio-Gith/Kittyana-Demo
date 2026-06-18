_color = text_color
selected = false

var _device = InputPlayerGetDevice();
if InputDeviceIsGamepad(_device) {
	event_perform(ev_mouse, ev_global_left_release)
} else {
	if not selected{
		//window_set_cursor(cursor)
	}
}