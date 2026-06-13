if other.master != self and array_contains(other.attacked, self) == false and not invincible{
	array_push(other.attacked, self)
	hp -= other.damage;
	show_debug_message(hp);
	alarm_set(2, 5)
	
	// Knockback
	vsp += other.knockback_strength_y
	hsp += other.master.image_xscale * other.knockback_strength_x
	
	// I-frames
	invincible = true
	alarm_set(2, invincibility_duration*game_get_speed(gamespeed_fps))
}