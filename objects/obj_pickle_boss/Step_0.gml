/// @description Main/State Machine


timeUp = (alarm_get(0) <= 0)
cd = 180+random_range(20, 50)
random_attack = round(random_range(1,3))

check_player_dir()
if charging == false {hspd = _movespeed*dir;}
if timeUp and random_attack == 1 {
	// Charge Attack
	call_later(1/60, time_source_units_seconds, function(){chargeAtk()})
	didCharge = true;
	charging = true;
	alarm_set(0, cd);
	
} else if timeUp and random_attack == 2 {
	// Summon
	
	if didCharge and didSlam {
		if canSummon {
			call_later(1/60, time_source_units_seconds, function(){
					summonAtk( round( random_range(20,30) ) );
				})
			canSummon = false;
		} else {show_debug_message("Can't summon yet")}
		
		didCharge = false;
		didSlam = false;
		alarm_set(0, cd)	
	} else {/*next attack please*/}
	
} else if timeUp and random_attack == 3 {
	// Slam Attack
	
	call_later(1/60, time_source_units_seconds, function(){slamAtk()})
	didSlam = true;
	alarm_set(0, cd)
	
}