xstart = x; ystart = y

if (hp <= 0) game_over()

if (not can_move) exit;
var input = -InputX(INPUT_CLUSTER.NAVIGATION)

// Flips the player's sprite
if (input != 0) and state != ACTION_STATES.SLIDING
{
    image_xscale = sign(input) * scale;
	facing = sign(image_xscale)
}

// Decrement the dash's cooldown
if (dash_cooldown_timer > 0) {dash_cooldown_timer -= get_delta_time_in_seconds();}
else {can_dash = true;}

#region Safety Respawn/Teleport
update_srays()
if all_srays() != noone // all rays are touching the ground
and on_ground // the player is confirmed to be on the ground
{
	safe_pos.x = safety_rays.cen.x
	safe_pos.y = safety_rays.cen.y
}
#endregion

switch state {
	#region Dashing Action
	case ACTION_STATES.DASHING:
		dash_timer -= get_delta_time_in_seconds();
		hsp = dash_speed * sign(image_xscale);
		vsp = 0;
		
		invincible = true
		
		// Dash Trail
		with instance_create_depth(x, y, depth+1, obj_dash_trail) {
			image_alpha = 1; // Sets its starting transparency
			_color = c_aqua; // This sets the color of the trail
			_tick_rate = 0.05 // How fast it fads
			
			image_speed = 0;
			image_index = other.image_index
			sprite_index = other.sprite_index;
			_color = c_aqua; // This sets the color of the trail
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		
		if (dash_timer <= 0) { // Once the dash has run out, reset
		    dash_cooldown_timer = dash_cooldown;
		    can_dash = false;
			invincible = false
			state = ACTION_STATES.NONE;
		}
		
	break;
	#endregion

	#region Hooking Action
	case ACTION_STATES.HOOKED:
	// for some reason this only works when it not done w/ the inputreleased, idk why
	if hook_length > hook_max_dist {
		state = ACTION_STATES.NONE
	}
	
	if InputCheck(INPUT_VERB.HOOK) {
		var _hookAngAccel = -hook_accel_rate * dcos(hook_angle);
		/*
		hookAngAccel is how quickly we are moving along a circle
		dcos() is cos in degrees and slows us down and speeds us up like a pendulum
		-hook_accel_rate decides how fast all this plays out fr
		
		Basically this combines the angle w/ acceleration
		*/
		
		// interactivettttyyyyyy
		_hookAngAccel += input * accel/10 // this here lets us accelerate and decel a bit when we're trying to move while grappling
		hook_length += InputY(INPUT_CLUSTER.NAVIGATION)*2 // lets us move up and down
		hook_length = max(hook_length, 60)
		
		angle_vel +=  _hookAngAccel;
		hook_angle += angle_vel;
		angle_vel *= damping_rate;
	
		hook_start_x = hook_target_x+lengthdir_x(hook_length, hook_angle);
		hook_start_y = hook_target_y+lengthdir_y(hook_length, hook_angle);
		
		hsp = hook_start_x - x
		vsp = hook_start_y - y
	}
	
	else if InputReleased(INPUT_VERB.HOOK){
		state = ACTION_STATES.NONE
	}
	
	if array_length(_hCol) > 0 {
		hook_angle = point_direction(hook_target_x, hook_target_y, x, y);
		angle_vel = 0
	}
		
	break;
	#endregion

	#region Normal/No Action State
	case ACTION_STATES.NONE: 
		// --- MOVING ---
	    target_speed = input * walk_speed;
	    if (on_ground) {
			if !global.isRunning {
				hsp = lerp(hsp, input * walk_speed, accel*2); // you can get up to walking speed faster than you can when you run -S
			} else {
				hsp = lerp(hsp, input * run_speed, accel);
			}
		}
	    else {  // air movement
			if !isRunning {
				hsp = lerp(hsp, input * walk_speed, accel*2); // you can get up to walking speed faster than you can when you run -S
			} else {
				hsp = lerp(hsp, input * run_speed, accel*2);
			}
		}
		
		// Walk <--> Run
		#region simple ver
		if global.GAME_SETTINGS.RUNTYPE {
			if InputPressed(INPUT_VERB.RUN) {
				global.isRunning = !global.isRunning
			}
		}
		#endregion
		
		#region build up ver
		else {
			global.isRunning = isRunning
			// If plr is moving and is walking, tick down this time
			if input != 0 and not isRunning {walkTime-=get_delta_time_in_seconds()}
			// if the player walks for long enough so that the timer hits 0, activate running
			if walkTime <= 0 {isRunning = true}
		
			// if the player was running but has stopped moving
			// tick down the "was running" timer
			if isRunning and input == 0 {
				if sinceRunning <= 0 {
					sinceRunning = sinceRunning_MAX
				} else {sinceRunning -= get_delta_time_in_seconds()}
			} else if isRunning and input != 0 {
				sinceRunning = sinceRunning_MAX
			} 
		
			if sinceRunning <= 0 {
				walkTime = walkTime_MAX
				isRunning = false;
			}
		}
		#endregion
		
		// --- FRICTION ---
	    if (input == 0 && on_ground) hsp = lerp(hsp, 0, ground_friction);		// ground slowdown
		else if (input == 0 && !on_ground) hsp = lerp(hsp, 0, air_friction);	// slowdown in air

	    // --- GRAVITY ---
		if (!on_ground) vsp += grv;
		
	    if not on_ground {
			coyote_timer -= 1; // should update to be deltatime? this is a question -S
	       
			if wall_ray_front() != noone and InputPressed(INPUT_VERB.JUMP) and tile_is_climbable() {
				state = ACTION_STATES.CLIMBING
				vsp = -run_speed;				// climb up
		        jumps_left = max_jumps;			// reset double jump
		        coyote_timer = coyote_time_max;	// allow jump off wall quickly
			}
		}
		else { 
			jumps_left = max_jumps;
			coyote_timer = coyote_time_max;
		}

		// --- DASH --- 
		if InputPressed(INPUT_VERB.DASH) and can_dash and dash_cooldown_timer <= 0 {
	        state = ACTION_STATES.DASHING;
	        dash_timer = dash_time;
	    }
		
	    // --- JUMP / DOUBLE JUMP ---
	    if ((InputPressed(INPUT_VERB.JUMP)) and jumps_left > 0) {
			if global.isRunning	{vsp = jump_speed;}
			else			{vsp = -walk_speed*1.5;}
			
			if (on_ground or coyote_timer > 0) {
	            can_dash = true;
	            coyote_timer = 0;
	        }
			
			jumps_left--;
	    }

		// --- HOOK ---
	    if (InputPressed(INPUT_VERB.HOOK)) {
			hook_obj = collision_circle(x, y, hook_max_dist, obj_hookwall, false, true)
	        if (hook_obj != noone) 
			{
				state = ACTION_STATES.HOOKED;
				
	            hook_target_x = hook_obj.x + (hook_obj.sprite_width/2);
	            hook_target_y = hook_obj.y + (hook_obj.sprite_height/2);
				
				angle_vel = hsp/2; // how much of your init momentum that gets carried over
				
				hook_angle = point_direction(hook_target_x, hook_target_y, x, y);
				hook_length = point_distance(hook_target_x, hook_target_y, x, y);
				hook_start_x = x; hook_start_y = y
	            can_dash = true;
	        }
	    }
		
		// --- SLIDE ---
		if (InputPressed(INPUT_VERB.SLIDE)) {
			state = ACTION_STATES.SLIDING
			hsp += 0.01 * sign(image_xscale)
		}
		
	break;
	#endregion
	
	#region Climbing Action
	case ACTION_STATES.CLIMBING:
		
		if wall_ray_front() == noone or on_ground or !tile_is_climbable()
		{state = ACTION_STATES.NONE} 
		else {
			vsp = InputY(INPUT_CLUSTER.NAVIGATION) * run_speed	// climb up
			jumps_left = max_jumps;								// reset double jump
			coyote_timer = coyote_time_max;						// allow jump off wall quickly
			
			// Wall jump
			if InputPressed(INPUT_VERB.JUMP) {
				vsp = jump_speed;
				hsp = (jump_speed/1.5)*sign(image_xscale)
			    can_dash = true;
			    coyote_timer = 0;
				jumps_left--;
			}	
		}
	break;
	#endregion
	
	#region Sliding Action
	case ACTION_STATES.SLIDING:
		if InputReleased(INPUT_VERB.SLIDE) {//or (hsp == 0 and slideEnding) {
			state = ACTION_STATES.NONE
			slideEnding = false
		}
	
		var slideDir = (run_speed * sign(image_xscale))

		 // --- GRAVITY ---
		if (!on_ground) vsp += grv*2;
		
		if hsp == slideDir*slideSpdMul and not slideEnding {
			slideEnding = true
		}
		
		if not slideEnding {
			hsp = lerp(hsp, slideDir*slideSpdMul, accel)
		}
		else {
			hsp = lerp(hsp, 0, ground_friction*2)
		}
		
		
	break;
	#endregion
	
	#region Frozen "Action"
	case ACTION_STATES.FROZEN:
		hsp = 0;
		vsp = 0;
	break;
	#endregion
}

#region Movement
_hCol = move_and_collide(hsp, 0, col_obj, ceil(abs(hsp)))
_vCol = move_and_collide(0, vsp, col_obj, ceil(abs(vsp)))

/* 
	Both are just collision lines that are placed on the
	left and right side of the bounding box and end at the bottom of it as well + a few pixels
	If one of them hits something then that means we've collided with the ground probably
*/

// Walk up slopes
if col_ray_front(col_obj) != noone { // Front ray has hit something
	vsp = 0;
	on_ground = true;
		
}
// Walk down slopes
else if col_ray_behind(col_obj) != noone { // Back ray has hit something
	vsp = abs(hsp)
	on_ground = true
} 	
// Airborne
else {
	on_ground = false
}

//// One-way Ground Collision
//else if (vsp >= 0 
//and not InputCheck(INPUT_VERB.DOWN) 
//and place_meeting(x, y + vsp, obj_oneway) and touching_top() > 0) {
	
//	while (!place_meeting(x, y + sign(vsp), obj_oneway) and touching_top > 0) {
//		y += sign(vsp);
//	}

//	if (vsp > 0) on_ground = true;

//	vsp = 0;
//}

//y += vsp;

#region Ceiling Bump
if ceilray_f(col_obj) != noone or ceilray_b(col_obj) != noone {vsp = 0}
#endregion

#endregion


#region Violence

#region Hook Grab
if grab_cd > 0 {grab_cd -= get_delta_time_in_seconds()}
if InputLong(INPUT_VERB.HOOK) and grab_cd <= 0 {
	var _enemy = noone
	// set enemy to this if it doesn't have the heavy tag
	if !asset_has_tags(hookgrab_circlecast(), "heavy", asset_object) or !asset_has_tags(hookgrab_circlecast(), "boss", asset_object) {
		_enemy = hookgrab_circlecast()
	}
	
	_pulled_target = _enemy // Ref for drawing the rope
	pull_force = lerp(pull_force, pull_force_max, pull_accel)
	
	if _enemy != noone 
	and hookgrab_in_min_range(_enemy)
	and collision_line(x,y, _enemy.x, _enemy.y, col_obj, false, true) != col_obj
	{ // If someone is in range, and not too close or to far, GRAB THEM
		with _enemy { // Pushes the enemy towards the player
			var _dir = point_direction(other.x, other.y, x, y)
			var _dx = dcos(_dir)
			var _dy = -dsin(_dir) 
			// In GML, the Y Axis is inverted, so it has to be inverted here
			
			hspd = _dx * -other.pull_force
			vspd = _dy * -other.pull_force
		}
	} 
} else if InputLongReleased(INPUT_VERB.HOOK) or 
hookgrab_in_min_range(_pulled_target) {
	_pulled_target = noone;
	pull_force = lerp(pull_force, 0, pull_accel*5);
	
	if grab_cd <= 0 {grab_cd = grab_cd_max}
}
#endregion

#region Katana
	if WeaponType == "Katana"
	{
		if global.GAME_SETTINGS.FREE_AIM == false
		{
			// Katana attack 1
			if InputPressed(INPUT_VERB.ATTACK_1) and Current_Atk = 0 and Attack_Delay = false
			{
				createHitbox(10, self, 100*facing, 0, 5, 2.5,4)
				alarm_set(1, 10);
				alarm_set(0, 20);
				Attack_Delay = true;
				Current_Atk += 1;
			}
			// Katana attack 2
			if InputPressed(INPUT_VERB.ATTACK_1) and Current_Atk = 1 and Attack_Delay = false
			{
				createHitbox(20, self, 100*facing,0,5,4,2)
			
				alarm_set(1, 25);
				alarm_set(0, 40);
				Attack_Delay = true;
				Current_Atk += 1;
			}
		} else {
			var aim_dir = free_aim().x
			
			// Katana attack 1
			if InputPressed(INPUT_VERB.ATTACK_1) and Current_Atk = 0 and Attack_Delay = false
			{
				vsp = -grv
				createHitbox(10, self, 100*aim_dir, 0, 5, 2.5,4)
				alarm_set(1, 10);
				alarm_set(0, 20);
				Attack_Delay = true;
				Current_Atk += 1;
			}
			// Katana attack 2
			if InputPressed(INPUT_VERB.ATTACK_1) and Current_Atk = 1 and Attack_Delay = false
			{
				vsp = -grv
				createHitbox(20, self, 100*aim_dir,0,5,4,2)
			
				alarm_set(1, 25);
				alarm_set(0, 40);
				Attack_Delay = true;
				Current_Atk += 1;
			}
		}
	}
#endregion Katana



#endregion Violence


#region Animations
if alarm_get(1) > 0
{
	if Current_Atk = 1
	{
		sprite_index = spr_player_vertslash;
		image_speed = 1;
	}
	
	if Current_Atk = 2
	{
		sprite_index = spr_player_sideslash;
		image_speed = 1;
	}
}
else
{
	if (state = ACTION_STATES.CLIMBING)
	{
	    sprite_index = spr_climb;
		image_speed = sign(vsp)*4;
		
	    
	}
	else if (not on_ground)
	{
	    sprite_index = spr_player_jump;
	    image_speed = 0.6;
	}
	else if (abs(hsp) > 0.1)
	{
	    sprite_index = spr_player_run;
	    image_speed = 1;		
	}
	else
	{
	    sprite_index = spr_player_idle;
	    image_speed = 1;
	}
}
#endregion