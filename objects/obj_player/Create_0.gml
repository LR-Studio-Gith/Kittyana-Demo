// Movement
hsp = 0;
vsp = 0;
grv = .45;
walk_speed = 10;
accel = 0.25;
jump_speed = -15;

max_jumps = 1;  
jumps_left = max_jumps

max_hurt_time = 60

col_obj = layer_tilemap_get_id("Collision")

function col_ray_behind() {
	var ray = collision_line(
		bbox_local_left(), y,
		bbox_local_left(), bbox_bottom+1,
		col_obj,
		true,
		true
	)

	return ray
}
function col_ray_front() {
	var ray = collision_line(
		bbox_local_right(), y,
		bbox_local_right(), bbox_bottom+1,
		col_obj,
		true,
		true
	)

	return ray
}

function touching_top() {
	if instance_exists_paused(obj_oneway) {
		return obj_oneway.bbox_top - bbox_bottom + vsp + grv*2
		/*	
			This janky ass "vsp + grv*2" just works ALRIGHT, JUST PRAY THE GAME DOESN'T LAG OUT -S
		*/
	} else {return 1} //Returning 1 will always make it true
}



#region Creation of Pause Menu
if !instance_exists(obj_pause_manager) {
	show_debug_message("Pause Manager absent, creating new one...")
	instance_create_depth(x, y, depth, obj_pause_manager)
} else {
	show_debug_message("Pause Manager exists already!")
}
if !instance_exists(obj_pause_screen) {
	show_debug_message("Pause screen overlay absent, creating new one...")
	instance_create_depth(x, y, depth, obj_pause_screen)
} else {
	show_debug_message("Pause screen already exists, you're good to go!")
}
#endregion

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
hook_speed = 16;
hook_target_x = 0;
hook_target_y = 0;
hooking = false;

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

on_ground = isGrounded()

//set_flash_shader_color(#FF0000)
function isGrounded(downward_y=50) {
	if !instance_exists_paused(self.object_index) {/*Wait until game starts*/} 
	else {
			var raycast = collision_line(
				x, y,
				x, y+downward_y,
				col_obj,
				true,
				true
			);
			
			return raycast != noone 
			// Returns true if it detects the ground 
			// Returns false otherwise
	}
}

enum ACTION_STATES {
	NONE,
	DASHING,
	HOOKED,
	FROZEN, // aka a do nothing state
}
state = ACTION_STATES.NONE