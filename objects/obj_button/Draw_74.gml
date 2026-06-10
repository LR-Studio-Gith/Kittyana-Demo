var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if(position_meeting(_mouse_x, _mouse_y, id)) {
	event_perform(ev_mouse, ev_mouse_enter)
} else {
	event_perform(ev_mouse, ev_mouse_leave)
}