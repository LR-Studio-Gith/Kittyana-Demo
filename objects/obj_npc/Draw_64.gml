if talking == true
{
	if InputPressed(INPUT_VERB.ATTACK_1) {
		if skip_buffer == true {current_text += 1;}
		skip_buffer = false;
	}
	else {skip_buffer = true;}

	draw_sprite_stretched(spr_textbox, 0, 250, 600, 750, 250);

	// 0
	if current_text == 0
	{
		who_is_talking(2)
		create_dialog("JINX", "Uncle, I hunger")
	}

	// 1
	if current_text == 1
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", "Wha. I have no cash.")
	}

	// 2
	if current_text == 2
	{
		who_is_talking(2)
		create_dialog("JINX", [
		"I don't need cash, there's a sign saying",
		"there's free food for guards only.",
		])
	}

	// 3
	if current_text == 3
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", "Oh, I see...")
	}

	// 4
	if current_text == 4
	{
		who_is_talking(2)
		create_dialog("JINX", "Barley...?") // geniually wtf is this dialog
	} 

	// 5
	if current_text == 5
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", [
		"You want me to give you a guard uniform", 
		"so you can pretend you're a guard?"])
	}

	// 6
	if current_text == 6
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", "Huh, well why the hell not.")
	}

	// 7
	if current_text == 7
	{
		who_is_talking(2)
		create_dialog("JINX", "Before you say no-...")
	}

	// 8
	if current_text == 8
	{
		who_is_talking(2)
		create_dialog("JINX", "Wait you said yes? Wahooyipee!")
	}

	// 9
	if current_text == 9
	{
		who_is_talking(1);
		create_dialog("UNCLE C.", "Wait, four things before you go.");
	}

	// 10
	if current_text == 10
	{
		who_is_talking(2);
		create_dialog("JINX", "What nowwwwwww.");
	}

	// 11
	if current_text == 11
	{
		who_is_talking(1);
		create_dialog("UNCLE C.", [
			"First I taught you how to fight.",
			"Use that sword I gave you."
		])
	}

	// 12
	if current_text == 12
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", [
		"Second, don't get stuck.", 
		"You don't want Nova to save you again."
		])
	}

	// 13
	if current_text == 13
	{
		who_is_talking(2)
		create_dialog("JINX", "Don't remind me.")
	}

	// 14
	if current_text == 14
	{
		who_is_talking(1)
		create_dialog("UNCLE C.", [
		"And third, don't tell your mother.", 
		"Or she'll take my other eye."
		])
	}

	// 15
	if current_text == 15
	{
		who_is_talking(1);
		create_dialog("UNCLE C.",
		[
			"There's reasons why I have this scar",
			"in the first place, and that's all."
		])
	}

	// 16
	if current_text == 16
	{
		who_is_talking(2);
		create_dialog("JINX", "Didn't you say four?")
	}

	// 17
	if current_text == 17
	{
		who_is_talking(1);
		create_dialog("UNCLE C.", [
			"Oh yeah.",
			"If you make a joke about my eye again,", 
			"I'll make sure you see 'barley' too."
		])
	}

	// 18
	if current_text == 18
	{
		who_is_talking(2)
		create_dialog("JINX", "Sheeesh, yes sir.")
	}

	// 19
	if current_text == 19
	{
		who_is_talking(1);
		create_dialog("UNCLE C.", [
			"Atta-they!",
			"Go get 'em!"
		])
	}

	// END
	
if current_text == 20
{
	obj_player.state = ACTION_STATES.NONE
	talking = false;
	current_text = 21;
	

	with (obj_tempwall)
	{
		instance_destroy();
	}
}

if current_text = 21 
{
	obj_player.state = ACTION_STATES.FROZEN
	//draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
	//draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);
	//draw_text_transformed(260, 610, "Jinx", 0.5, 0.5, 0);
	//draw_text_transformed(260, 640, "I'm not talking to you again.", 0.5, 0.5, 0);
	
	who_is_talking(2)
	create_dialog("JINX", "I'm not talking to you again.")
}
if current_text = 22
{
	obj_player.state = ACTION_STATES.NONE
	talking = false;
	current_text = 21;
	
}
}