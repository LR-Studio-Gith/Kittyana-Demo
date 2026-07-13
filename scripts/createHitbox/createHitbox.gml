function createHitbox(seconds, owner, _x, _y, damage, xscale, yscale, 
knockback_strength_x = 0,
knockback_strength_y = 0,
hit_friend = false,
hit_enemy = false,
hit_object = false,
projectile = false,){
	var _hitbox = instance_create_depth(owner.x + _x, owner.y + _y, depth, obj_hitbox, 
		{
			lifetime				: seconds,
			master					: owner,
			base_x					: _x,
			base_y					: _y,
			damage					: damage,
			image_xscale			: xscale,
			image_yscale			: yscale,
			knockback_strength_x	: knockback_strength_x,
			knockback_strength_y	: knockback_strength_y,
									
			// optionals			
			hit_friend				: hit_friend,
			hit_enemy				: hit_enemy,
			hit_object				: hit_object,
			projectile				: projectile,
		});
		
	return _hitbox
}