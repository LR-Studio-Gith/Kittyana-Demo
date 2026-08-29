enum BUTTON {
	PLAY,
	HELP,
	QUIT
} 

currentButton = BUTTON.PLAY

playB = obj_button_play
helpB = obj_button_help
quitB = obj_button_quit

upAct = InputPressed(INPUT_VERB.UP) or InputRepeat(INPUT_VERB.UP)
downAct =  InputPressed(INPUT_VERB.DOWN) or InputRepeat(INPUT_VERB.DOWN)

function updateActs() {
	upAct = InputPressed(INPUT_VERB.UP) or InputRepeat(INPUT_VERB.UP)
	downAct = InputPressed(INPUT_VERB.DOWN) or InputRepeat(INPUT_VERB.DOWN)
}

function switchButton(obj, button) {
	hoverStop(obj)
	currentButton = button
}

function press(obj) 
{
	if object_exists(obj)
	{
		with obj {
			event_perform(ev_mouse, ev_left_press)
		}
	}
}

function hoverDo(obj) 
{
	if object_exists(obj)
	{
		with obj {
			event_perform(ev_mouse, ev_mouse_enter)
		}
	}
}

function hoverStop(obj) 
{
	if object_exists(obj)
	{
		with obj {
			event_perform(ev_mouse, ev_mouse_leave)
		}
	}
}

