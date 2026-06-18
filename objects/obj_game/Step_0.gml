if not audio_is_playing(snd_rainworld) {
	show_debug_message("GML IS A BITCHHHHHHHHHHHHHHHH")
	audio_play_sound(snd_rainworld, 100, true);
}


updateActs()
var _device = InputPlayerGetDevice();
if InputDeviceIsGamepad(_device)
{
	switch currentButton
	{
		case BUTTON.PLAY:
			hoverDo(playB)
		
			if InputPressed(INPUT_VERB.JUMP) {press(playB)}
		
			if downAct {
				switchButton(playB, BUTTON.HELP)
			}
		break;
		case BUTTON.HELP:
			hoverDo(helpB)
		
			if InputPressed(INPUT_VERB.JUMP) {press(helpB)}
		
			if upAct {
				switchButton(helpB, BUTTON.PLAY)
			}
			if downAct {
				switchButton(helpB, BUTTON.QUIT)
			}
		break;
		case BUTTON.QUIT:
			hoverDo(quitB)
		
			if InputPressed(INPUT_VERB.JUMP) {press(quitB)}
		
			if upAct {
				switchButton(quitB, BUTTON.HELP)
			}
		break;
	}
}