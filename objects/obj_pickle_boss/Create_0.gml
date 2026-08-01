// Movement
dir = 0;
hspd = 0;
vspd = 0;
player = obj_player;

push_f = 50

// Functiosn
function check_player_dir()
{
	player_dir = player.x - x; 
	//show_debug_message(image_xscale)
	if player_dir > 50 {
		dir = 1;	
	} 
	else if player_dir < -50 {
		dir = -1;
	}
	else {
		dir = dir;
	}
}

backwards = false;
function faceplayer() {
	if dir = -1 and not backwards{image_xscale*=-1; backwards = true}
	else if dir = 1 and backwards {image_xscale*=-1; backwards = false}
}

alarm[0] = 120
timeUp = (alarm_get(0) <= 0)
max_hurt_time = 60

didCharge = false;
didSlam = false;
charging = false;
canSummon = true;

col_obj = layer_tilemap_get_id("Collision")

/*

Charge: launches itself towards you, can't aim upwards.
Cue summon: summons 5 cumberlings from the sky that fall to the ground. 
they also die in one hit
Body slam: launches itself into the air then fast falls back down

*/

function isGrounded(downward_y=50) {
	if !object_exists(self.object_index) {/*Wait until game starts*/} 
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

#region Attacks
cd = 80+random_range(10, 20)
function chargeAtk() {
	show_debug_message("Charge Attack")
	hspd = 10*dir;
	createHitbox(cd-10, self, 30*dir, 0, 1, 8, 4.5);
}

function summonAtk(waittime) {
	show_debug_message("Summon")
	
	minion1 = instance_create_depth(random_range(600, 2000),250,depth,obj_enemy);
	//minion2 = instance_create_depth(x,y-summon_y+20,depth,obj_enemy);
	//minion3 = instance_create_depth(x,y-summon_y,depth,obj_enemy);
		
	//with minion1 {hspd += 300;}	
	//with minion3 {hspd -= 300;}
	
	call_later(waittime, time_source_units_seconds, function(){canSummon = true;})
}

function slamAtk() {
	show_debug_message("Slam Attack");
	_fallspeed = -5
	
	call_later(1, time_source_units_seconds, 
	function() {
		_fallspeed = 70
		createHitbox(5, self,0,0,1,20,20)
	})
}
#endregion


function get_unstuck_goddamnit() {
	// this will literally never be used anyone else i bet
	if wall_ray_front(col_obj) != noone{
	switch (sign(image_xscale)) {
	    case 1: // Right
	        move_contact_all(180, push_f)
	        break;
		case -1: // Left
	        move_contact_all(360, push_f)
	        break;	
	    default: // If somehow neither
	        move_contact_all(180, push_f)
	        break;
	}
}
else if wall_ray_back(col_obj) != noone{
	switch (sign(image_xscale)) {
	    case 1: // Left
	        move_contact_all(360, push_f)
	        break;
		case -1: // Right
	        move_contact_all(180, push_f)
	        break;	
	    default: // If somehow neither
	        move_contact_all(360, push_f)
	        break;
	}
}
}