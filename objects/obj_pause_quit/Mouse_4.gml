// Inherit the parent event
event_inherited();

obj_pause_screen.is_paused = false
obj_pause_manager.unpause_tag("pauseable");
layer_set_visible("PauseLayer", false);
room_restart()
room_goto(rm_menu) // home menu