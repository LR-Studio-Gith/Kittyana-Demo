// Inherit the parent event
event_inherited();

enabled = global.GAME_SETTINGS.RUNTYPE
og_text = button_text

if enabled {
	button_text = alt_text
} else {
	button_text = og_text
}