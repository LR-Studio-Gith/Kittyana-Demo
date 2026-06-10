/// @description Default Checks

if _health <= 0 current_state = STATE.DIE;
vspd = _fallspeed;
check_player_dir();
faceplayer();

move_bounce_all(false)

// testing that the repo works and github is working fine