if other.master != self and array_contains(other.attacked, self) == false{
	array_push(other.attacked, self)
	hp -= other.damage;
	show_debug_message(hp);
	alarm_set(2, 5)
	//do_flash()
	
	vsp += other.knockback_strength_y
	hsp += other.master.image_xscale * other.knockback_strength_x
}