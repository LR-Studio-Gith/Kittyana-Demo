/// @description Motion & Collision

move_and_collide( hspd, 0, col_obj, abs(ceil(hspd)) )

move_and_collide( 0, vspd, col_obj, abs(ceil(vspd)) )

// Walk up slopes
if col_ray_front(col_obj) != noone { // Front ray has hit something
	vspd = 0;
	on_ground = true;
		
}
// Walk down slopes
else if col_ray_behind(col_obj) != noone { // Back ray has hit something
	vspd = abs(hspd)
	on_ground = true
} 	
// Airborne
else {
	on_ground = false
}
