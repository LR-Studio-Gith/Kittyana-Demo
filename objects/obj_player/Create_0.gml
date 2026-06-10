// Movement
hsp = 0;
vsp = 0;
grv = .45;
walk_speed = 10;
accel = 0.25;
jump_speed = -15;

max_jumps = 2;  
jumps_left = max_jumps

function touching_top() {
	if instance_exists_paused(obj_oneway) {
		return obj_oneway.bbox_top - bbox_bottom + vsp + grv*2
		/*	
			This janky ass "vsp + grv*2" just works ALRIGHT, JUST PRAY THE GAME DOESN'T LAG OUT -S
		*/
	} else {return 1} //Returning 1 will always make it true
}

// I-Frames
invincible = false;
invincibility_duration = .2;

slope_max = 4
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
				[obj_Solid, obj_oneway], // Oneway as been added since it also needs to be checked
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