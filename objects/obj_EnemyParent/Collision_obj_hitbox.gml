var attacker = other.master.object_index

if attacker != self 
and not array_contains(other.attacked, self)
and not (asset_has_tags(attacker, "enemy") or asset_has_tags(attacker, "boss"))
{
	array_push(other.attacked, self)
	_health -= other.damage;
	alarm_set(3, max_hurt_time)
	
	//show_debug_message(asset_get_tags(attacker) )
}