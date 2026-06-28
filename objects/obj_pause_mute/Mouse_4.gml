// Inherit the parent event
event_inherited();

audio_paused = !audio_paused

if audio_paused {
	audio_pause_all()
	button_text = "Unmute Music"
} else {
	audio_resume_all()
	button_text = og_text
}