// Inherit the parent event
event_inherited();

enabled = !enabled

if enabled {
	global.GAME_SETTINGS.FREE_AIM = true
	button_text = "Disable Free-Aim"
} else {
	global.GAME_SETTINGS.FREE_AIM = false
	button_text = og_text
}