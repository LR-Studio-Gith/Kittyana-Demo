// States
enum ACTION_STATES { // States are based on if an action can't be done while doing any other action
	NONE,
	DASHING,
	HOOKED,
	CLIMBING,
	SLIDING,
	FROZEN, // aka a do nothing state, used for talking mostly
}
state = ACTION_STATES.NONE 

#region Movement
on_ground = false;

// Run/Walk
hsp = 0;
vsp = 0;

grv = .45;
walk_speed = 5.5;
run_speed = 10;
accel = 0.25;

// Friction
ground_friction = 0.1;
air_friction	= 0.05;

// Jumping
max_jumps = 2;  
jumps_left = max_jumps;
jump_speed = -15;

// CDs
coyote_time_max = 6; 
coyote_timer = 0;
can_move = true; // ???? -S

// Slide
slideSpdMul = 2; // multiplier to apply onto sliding. SlideSpd = run_spd * slideSpdMul
slideEnding = false;

#region Dash
// Motion
dash_speed = 30;
dash_time = .15;

// Cooldowns
dash_cooldown = 0.5;
dash_timer = 0;
dash_cooldown_timer = 0;

// Control Checks
can_dash = true;
dashing = false;
#endregion

#region Hook
hook_target_x = undefined;
hook_target_y = undefined;
hooking = false;

// Controls (edit it if your a dev)
hook_max_dist = 300; // Max distance in pixels the player can get from a hookpoint
damping_rate = 0.99; //% How much speed the player loses per swing
hook_accel_rate = 0.2; // How fast the player accelerates on a swing
#endregion

#endregion

#region Combat
max_hurt_time = 60 // Hurt flash timer
hitbox = noone;

// I-Frames
invincible = false;
invincibility_duration = .2;

#region Hook Grab
// Range
grab_rad_max = 300
grab_rad_min = 75

// Force
pull_force_max = 35; pull_force = 0; 
pull_accel = 0.2;

// CD
grab_cd_max = 1.5; grab_cd = 0; 

_pulled_target = noone // for the draw event really
function hookgrab_drawtest() {	// for dev testing, lets you see the ranges of the grab
	// bright green = max range
	draw_set_colour(c_lime)
	draw_circle(
		x, y,
		grab_rad_max,

		true
	)

	// blue = min range
	draw_set_colour(c_blue)
	draw_circle(
		x, y,
		grab_rad_min,

		true
	)
}

function hookgrab_ropevisual() {
	var color = #633200
	draw_line_width_colour(
	x, y, 
	_pulled_target.x+_pulled_target.sprite_width/2, 
	_pulled_target.y+_pulled_target.sprite_height/2, 
	2, 
	color, color)
}

function hookgrab_in_min_range(_obj) {
	if _obj != noone {
		return abs(point_distance(x, y, _obj.x, _obj.y)) > grab_rad_min
	} else {
		return false
	}
}

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
#endregion

#endregion

#region Collisions
col_obj = layer_tilemap_get_id("Collision") // Collision ref

/// @desc  Checks if the tile counts as an climbable one
/// @returns {bool}
function tile_is_climbable() {
	var _tile = tilemap_get_at_pixel(col_obj, bbox_local_right() + sign(image_xscale), y)
	
	// One = The normal collision tile on the tilemap, the full one w/ out anything on it really
	if _tile == 1 {return true}
	else {return false}
}

function tile_is_oneway() {
	var _tile_L = tilemap_get_at_pixel(col_obj, bbox_local_left(), bbox_bottom + 1)
	var _tile_R = tilemap_get_at_pixel(col_obj, bbox_local_right(), bbox_bottom + 1)
	
	if _tile_L != _tile_R {return false} // if both arent the same kind of tile, false
	else {
		if _tile_R == undefined // set to undefined for now since we dont got a oneway tile yet
		{return true}
		else {return false}
	}
	
}
#endregion

function touching_top() { // outdated, old
	if instance_exists_paused(obj_oneway) {
		return obj_oneway.bbox_top - bbox_bottom + vsp + grv*2
		/*	
			This janky ass "vsp + grv*2" just works ALRIGHT, JUST PRAY THE GAME DOESN'T LAG OUT -S
		*/
	} else {return 1} //Returning 1 will always make it true
}

// Checks for if the pause system exists in a room,
// re-creates it if not
pause_exists();

// Scaling
scale = 0.4666667; // init. scale the player has across all rooms
image_xscale = scale;
image_yscale = scale;
facing = 1; // init. facing direction

// currently unused, falling into the void is impossible
#region Safe Respawn
safe_gap = 20; //px
safety_rays = {
	cen :	collision_line_point(x, y, x, y+1000, col_obj, false, true),
	lef :	collision_line_point(x+safe_gap, y, x+safe_gap, y+1000, col_obj, false, true),
	rig :	collision_line_point(x-safe_gap, y, x-safe_gap, y+1000, col_obj, false, true),
};

safe_pos = {
	x : safety_rays.cen.x,
	y : safety_rays.cen.y,
};

function update_srays() {
	safety_rays.cen = collision_line_point(x, y, x, y+1000, col_obj, false, true);
	safety_rays.lef = collision_line_point(x+safe_gap, y, x+safe_gap, y+1000, col_obj, false, true);
	safety_rays.rig = collision_line_point(x-safe_gap, y, x-safe_gap, y+1000, col_obj, false, true);
}
function all_srays() {
	if safety_rays.cen.magnitude == safety_rays.lef.magnitude 
	and safety_rays.cen.magnitude == safety_rays.rig.magnitude {
		return safety_rays.cen.id;
	} else {return noone;}
}

function safety_rays_draw() {
	var color = #FFFFFF;
	draw_line_width_colour(x, y, safety_rays.cen.x, safety_rays.cen.y, 2, color, color);
	draw_line_width_colour(x+safe_gap, y, safety_rays.lef.x, safety_rays.lef.y, 2, color, color);
	draw_line_width_colour(x-safe_gap, y, safety_rays.rig.x, safety_rays.rig.y, 2, color, color);
	draw_set_colour(c_purple);
	draw_circle(safe_pos.x, safe_pos.y, 5, false);
}
#endregion