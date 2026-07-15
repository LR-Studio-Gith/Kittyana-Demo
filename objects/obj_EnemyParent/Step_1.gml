/// @description Default Checks

if _health <= 0 current_state = STATE.DIE;
if not on_ground {vspd += _fallspeed;}
else {vspd = 0;}
check_player_dir();
faceplayer();

// Slope clipping
if place_meeting(x, y, col_obj) {
	var push_f = ceil( abs(hspd) ) + _movespeed
	switch (sign(image_xscale)) {
	    case 1: // Right
	        move_contact_all(180, push_f)
	        break;
		case -1: // Left
	        move_contact_all(0, push_f)
	        break;	
	    default: // If somehow neither
	        move_contact_all(90, push_f)
	        break;
	}
}