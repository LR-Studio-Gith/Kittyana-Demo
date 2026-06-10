if talking == true
{
	if InputPressed(INPUT_VERB.ATTACK)
	{
		if skip_buffer == true
		{
			current_text += 1;
		}
		skip_buffer = false;
	}
	else
	{
		skip_buffer = true;
	}

	draw_sprite_stretched(Textbox, 0, 250, 600, 750, 250);

	// 0
	if current_text == 0
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Uncle, I hunger.", 0.5, 0.5, 0);

	}

	// 1
	if current_text == 1
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Wha. I have no cash.", 0.5, 0.5, 0);
	}

	// 2
	if current_text == 2
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "I don't need cash, theirs a sign saying", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "theirs free food for guards only.", 0.5, 0.5, 0);
	}

	// 3
	if current_text == 3
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Oh, see...", 0.5, 0.5, 0);
	}

	// 4
	if current_text == 4
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Barley...?", 0.5, 0.5, 0);
	}

	// 5
	if current_text == 5
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "You want me to give a guard uniform", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "so you can pretend you're a guard?", 0.5, 0.5, 0);
	}

	// 6
	if current_text == 6
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Huh, well why the hell not.", 0.5, 0.5, 0);
	}

	// 7
	if current_text == 7
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Before you say no...", 0.5, 0.5, 0);
	}

	// 8
	if current_text == 8
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Wait you said yes? Wahooyipee!", 0.5, 0.5, 0);
	}

	// 9
	if current_text == 9
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Wait, four things before you go.", 0.5, 0.5, 0);
	}

	// 10
	if current_text == 10
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "What nowwwwwww.", 0.5, 0.5, 0);
	}

	// 11
	if current_text == 11
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "First I taught you how to fight.", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "Use that sword I gave you.", 0.5, 0.5, 0);
	}

	// 12
	if current_text == 12
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Second, don't get stuck.", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "You don't want Nova to save you again.", 0.5, 0.5, 0);
	}

	// 13
	if current_text == 13
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Dont Remind me.", 0.5, 0.5, 0);
	}

	// 14
	if current_text == 14
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "And third, don't tell your mother.", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "Or she'll take my other eye.", 0.5, 0.5, 0);
	}

	// 15
	if current_text == 15
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "There's reasons why I have this scar", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "in the first place, and that's all.", 0.5, 0.5, 0);
	}

	// 16
	if current_text == 16
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Didn't you say four?", 0.5, 0.5, 0);
	}

	// 17
	if current_text == 17
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Oh yeah.", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "If you make a joke about my eye again,", 0.5, 0.5, 0);
		draw_text_transformed(260, 700, "I'll make sure you see 'barly' too.", 0.5, 0.5, 0);
	}

	// 18
	if current_text == 18
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);

		draw_text_transformed(260, 610, "JINX", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Sheeesh, yes sir.", 0.5, 0.5, 0);
	}

	// 19
	if current_text == 19
	{
		draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_white, 1);
		draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_gray, 1);

		draw_text_transformed(260, 610, "C", 0.5, 0.5, 0);
		draw_text_transformed(260, 640, "Atta-they!", 0.5, 0.5, 0);
		draw_text_transformed(260, 670, "Go get 'em!", 0.5, 0.5, 0);
	}

	// END
	
	// Toby Fox would be so proud to see this -S
	
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
	draw_sprite_stretched_ext(spr_uncle_calm, 0, 800, 400, 200, 200, c_gray, 1);
	draw_sprite_stretched_ext(spr_jinx_calm, 0, 260, 400, 200, 200, c_white, 1);
	draw_text_transformed(260, 610, "Jinx", 0.5, 0.5, 0);
	draw_text_transformed(260, 640, "I'm not talking to you again.", 0.5, 0.5, 0);
}
if current_text = 22
{
	obj_player.state = ACTION_STATES.NONE
	talking = false;
	current_text = 21;
	
}
}