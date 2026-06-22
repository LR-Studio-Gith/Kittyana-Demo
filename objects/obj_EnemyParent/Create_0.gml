enum STATE
{
	IDLE,
	CHASE,
	ATTACK,
	STUNNED, // Gonna ask later if we should add a combo stun -S
	DIE
};
current_state = STATE.IDLE;
max_hurt_time = 60

col_obj = layer_tilemap_get_id("Collision")


// Movement
dir = 0;
hspd = 0;
vspd = 0;
player = obj_player;
attacking = false

starting_attack = undefined
attack = undefined

// Functiosn
function check_player_dir()
{
	player_dir = player.x - x; 
	
	if player_dir > attacking_range {dir = 1;} 
	else if player_dir < -attacking_range {dir = -1;}
	else {dir = dir;}
}

backwards = false;
function faceplayer() {
	if dir = -1 and not backwards{image_xscale*=-1; backwards = true}
	else if dir = 1 and backwards {image_xscale*=-1; backwards = false}
}

