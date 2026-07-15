// Inherit the parent event
event_inherited();

enabled = global.GAME_SETTINGS.FREE_AIM
og_text = button_text

if enabled {
	button_text = "Disable Free-Aim"
} else {
	button_text = og_text
}