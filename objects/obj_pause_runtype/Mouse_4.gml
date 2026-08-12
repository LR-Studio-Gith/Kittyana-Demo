// Inherit the parent event
event_inherited();

enabled = !enabled

if enabled {
	global.GAME_SETTINGS.RUNTYPE = true
	button_text = alt_text
} else {
	global.GAME_SETTINGS.RUNTYPE = false
	button_text = og_text
}