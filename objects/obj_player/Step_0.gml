if (hp <= 0) room_restart()

if (not can_move) exit;


var input = -InputX(INPUT_CLUSTER.NAVIGATION)

// Flips the player's sprite
if (input != 0)
{
    image_xscale = sign(input) * scale;
	facing = sign(image_xscale)
}

// Decrement the dash's cooldown
if (dash_cooldown_timer > 0) {dash_cooldown_timer -= get_delta_time_in_seconds();}
else {can_dash = true}

// If the player is in the dashing state
switch state {
	#region Dashing Action
	case ACTION_STATES.DASHING:
		dash_timer -= get_delta_time_in_seconds();
		hsp = dash_speed * wall_dir;
		vsp = 0;
		
		// Dash Trail
		with instance_create_depth(x, y, depth+1, obj_dash_trail) {
			image_speed = 0;
			image_index = other.image_index
			sprite_index = other.sprite_index;
			image_blend = c_aqua; // This sets the color of the trail
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		
		if (dash_timer <= 0) { // Once the dash has run out, reset
		    dash_cooldown_timer = dash_cooldown;
		    can_dash = false;
			state = ACTION_STATES.NONE;
		}
	break;
	#endregion

	#region Hooking Action
	case ACTION_STATES.HOOKED:		
	    var angle = point_direction(x, y, hook_target_x, hook_target_y);
	    var dist = point_distance(x, y, hook_target_x, hook_target_y);

	    var step = min(hook_speed, dist);
	    hsp = lengthdir_x(step, angle);
	    vsp = lengthdir_y(step, angle);
	
	    if (place_meeting(x + hsp, y + vsp, obj_ground) ||
	        place_meeting(x + hsp, y + vsp, obj_climbwall)) {
	        state = ACTION_STATES.NONE;
	        hsp = 0;
	        vsp = 0;
	    }
	  // Stop if reached target
	    if (dist < 4) state = ACTION_STATES.NONE;
	break;
	#endregion

	#region Normal/No Action State
	case ACTION_STATES.NONE: 
	    var target_speed = input * walk_speed;
	    if (on_ground) {hsp = lerp(hsp, target_speed, accel);}
	    else {hsp = lerp(hsp, target_speed, 0.1);}

	    if (input == 0 && on_ground) hsp = lerp(hsp, 0, friction);

	    // --- GRAVITY ---
	    if (!on_ground && !on_wall) vsp += grv;

	    // --- WALL CHECK ---
	    on_wall = false;
	    wall_dir = 0;
	    if (!on_ground) 
		{
			coyote_timer -= 1;
	        if (place_meeting(x + 1, y, obj_climbwall)) { on_wall = true; wall_dir = 1; }
	        else if (place_meeting(x - 1, y, obj_climbwall)) { on_wall = true; wall_dir = -1; }
	    } 
		else 
		{
			jumps_left = max_jumps
			coyote_timer = coyote_time_max;
		}

	    if (on_wall && InputPressed(INPUT_VERB.UP)) {
	        vsp = -walk_speed;				// climb up
	        jumps_left = max_jumps;			// reset double jump
	        coyote_timer = coyote_time_max; // allow jump off wall quickly
	    }
    

		if InputPressed(INPUT_VERB.DASH) and can_dash and dash_cooldown_timer <= 0 {
	        state = ACTION_STATES.DASHING;
	        dash_timer = dash_time;
	        wall_dir = (hsp != 0) ? sign(hsp) : 1;
	    }
		
	    // --- JUMP / DOUBLE JUMP ---
	    if ((InputPressed(INPUT_VERB.JUMP)) and jumps_left > 0) {
	        if (on_ground or coyote_timer > 0) {
	            vsp = jump_speed;
	            jumps_left = max_jumps;
	            can_dash = true;
	            coyote_timer = 0;
				jumps_left--;
	        }
	        else if (on_wall) {
	            vsp = jump_speed;
	            hsp = -wall_dir * walk_speed * 1.5;
	            jumps_left = max_jumps;
	        }
	        else if (jumps_left > 0) {
	            vsp = jump_speed;
	            jumps_left--;
	        }
	    }

	   

	    if (InputPressed(INPUT_VERB.HOOK)) {
	        var hook_obj = noone;
	        var dist_min = 300;
	        with (obj_hookwall) 
			{
	            var d = point_distance(other.x, other.y, x, y);
	            if (d < dist_min) {
	                dist_min = d;
	                hook_obj = id;
	            }
	        }
	        if (hook_obj != noone) 
			{
				state = ACTION_STATES.HOOKED;
	            hook_target_x = hook_obj.x;
	            hook_target_y = hook_obj.y;
	            can_dash = true;
	        }
	    }
	break;
	#endregion
	
	case ACTION_STATES.FROZEN:
		hsp = 0;
		vsp = 0;
	break;

}

on_ground = false;

#region Horizontal Movement
if (place_meeting(x + hsp, y, obj_ground)) {
    while (!place_meeting(x + sign(hsp), y, obj_ground)) x += sign(hsp);
    hsp = 0;
}
x += hsp;
#endregion

#region Vertical Movement

// Normal Ground Collision
if (place_meeting(x, y + vsp, obj_ground))
{
    while (!place_meeting(x, y + sign(vsp), obj_ground))
    {
        y += sign(vsp);
    }

    if (vsp > 0) on_ground = true;

    vsp = 0;

// One-way Ground Collision
} 
else if (vsp >= 0 
and not InputCheck(INPUT_VERB.DOWN) 
and place_meeting(x, y + vsp, obj_oneway) and touching_top() > 0) {
	
	while (!place_meeting(x, y + sign(vsp), obj_oneway) and touching_top > 0) {
		y += sign(vsp);
	}

	if (vsp > 0) on_ground = true;

	vsp = 0;
}

y += vsp;
#endregion


//if keyboard_check(vk_escape)
//{
//	game_end()
//}
//if keyboard_check(vk_enter)
//{
//	room_restart()
//}

#region Violence
#region Katana
	if WeaponType == "Katana"
	{
		// Katana attack 1
		if InputPressed(INPUT_VERB.ATTACK) and Current_Atk = 0 and Attack_Delay = false
		{
			createHitbox(10, self, 100*facing, 0, 5, 2.5,4)
			alarm_set(1, 10);
			alarm_set(0, 20);
			Attack_Delay = true;
			Current_Atk += 1;
		}
		// Katana attack 2
		if InputPressed(INPUT_VERB.ATTACK) and Current_Atk = 1 and Attack_Delay = false
		{
			createHitbox(20, self, 100*facing,0,5,4,2)
			
			alarm_set(1, 25);
			alarm_set(0, 40);
			Attack_Delay = true;
			Current_Atk += 1;
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
	if (on_wall && (InputCheck(INPUT_VERB.UP) or InputCheck(INPUT_VERB.JUMP)))
	{
	    sprite_index = spr_climb;
	    image_speed = 1;
	}
	else if (not isGrounded())
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