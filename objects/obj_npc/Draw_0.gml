draw_sprite(spr_uncle_c_sketch, 0, x, y);

if (obj_player.x > x - 75 and obj_player.x < x + 75)
{
	draw_sprite(spr_Can_talk, 0, x, y - 90);
	if InputPressed(INPUT_VERB.ATTACK_1)
	{
		
		talking = true;
		obj_player.state = ACTION_STATES.FROZEN
	}
}