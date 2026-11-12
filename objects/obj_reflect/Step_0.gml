if not projectile
{
	x = master.x + base_x;
	y = master.y + base_y;
}

if !instance_exists(master) {
	instance_destroy();
}