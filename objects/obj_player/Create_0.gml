// Movement
hsp = 0;
vsp = 0;
grv = .45;
walk_speed = 10;
accel = 0.25;
jump_speed = -15;

max_jumps = 2;  
jumps_left = max_jumps

max_hurt_time = 60

ground_friction = 0.1
air_friction	= 0.05

slideSpeed = 2
slideEnding = false

col_obj = layer_tilemap_get_id("Collision")

grab_rad_max = 250
grab_rad_min = 50

_pulled_target = noone

pull_force = 50;

function hookgrab_circlecast(_obj = obj_EnemyParent) {
	var _cols_list = ds_list_create() // data list to store all enemies in range
	var _cols_nums = collision_circle_list(
		x, y, grab_rad_max, 
		_obj, 
		false, true, _cols_list, true
	); 
	// returns the num of enemies in range & puts that into the list
	// automatically orders it by closest target
	
	var _closest_hit = ds_list_find_value(_cols_list, 0)
	if _cols_nums > 0 { // if we got a hit
		return _closest_hit
	} else {
		return noone
	}
}


function touching_top() {
	if instance_exists_paused(obj_oneway) {
		return obj_oneway.bbox_top - bbox_bottom + vsp + grv*2
		/*	
			This janky ass "vsp + grv*2" just works ALRIGHT, JUST PRAY THE GAME DOESN'T LAG OUT -S
		*/
	} else {return 1} //Returning 1 will always make it true
}

pause_exists();

function tile_is_climbable() {
	var _tile = tilemap_get_at_pixel(col_obj, bbox_local_right() + sign(image_xscale), y)
	
	// One = The normal collision tile on the tilemap, the full one w/ out anything on it really
	if _tile == 1 {return true}
	else {return false}
}




// I-Frames
invincible = false;
invincibility_duration = .2;

slope_max = 4

image_xscale = 0.4666667
image_yscale = 0.4666667

scale = image_xscale;

// Dash
dash_speed = 30;
dash_time = .15;
dash_cooldown = 0.5;

// Hook
hook_target_x = undefined;
hook_target_y = undefined;
hooking = false;

hook_max_dist = 300;
damping_rate = 0.99; //%
hook_accel_rate = 0.2;

// State
on_ground = false;
on_wall = false;
wall_dir = 0;

// Jump
coyote_time_max = 6; 
coyote_timer = 0;

can_move = true;

// Dash
can_dash = true;
dashing = false;
dash_timer = 0;
dash_cooldown_timer = 0;

// Starting position
facing = 1;

// Stuff
hitbox = noone;

on_ground = false //isGrounded()


enum ACTION_STATES {
	NONE,
	DASHING,
	HOOKED,
	CLIMBING,
	SLIDING,
	FROZEN, // aka a do nothing state
}
state = ACTION_STATES.NONE
