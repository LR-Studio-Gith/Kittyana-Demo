/// @description Main/State Machine

// State Machine
switch current_state
{
	case STATE.IDLE: {
		hspd = 0;
		
		if distance_to_object(player) < sight_distance {current_state = STATE.CHASE;}
	} break;
	
	case STATE.CHASE: {
		hspd =  _movespeed * dir;
		
		if distance_to_object(player) > sight_distance {current_state = STATE.IDLE;}
		if distance_to_object(player) < attacking_range {current_state = STATE.ATTACK;}
	} break;
	
	case STATE.ATTACK: {
		starting_attack = call_later(cooldown, time_source_units_seconds, function() {
			hspd = 0;
			if attacking = false {
				createHitbox(time, self, 50*dir, 0, damage, 3, 1.75, 40, 70);
				attacking = true;
				attack = call_later(attack_speed, time_source_units_seconds, function() {
					attacking = false;
				});
			}
		})
		
		if distance_to_object(player) < sight_distance {current_state = STATE.CHASE;}
	} break;
	
	case STATE.DIE: {
		hspd = 0; vspd = 0;
		instance_destroy();
	} break;
}




