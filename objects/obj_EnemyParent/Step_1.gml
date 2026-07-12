/// @description Default Checks

if _health <= 0 current_state = STATE.DIE;
if not on_ground {vspd = _fallspeed;}
else {vspd = 0;}
check_player_dir();
faceplayer();
