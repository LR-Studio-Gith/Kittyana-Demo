if not projectile
{
	x = master.x + base_x;
	y = master.y + base_y;
}
if place_meeting(x, y, obj_reflect)
{
	base_x = 0
	//master = obj_reflect.master
}

if !instance_exists(master) {
	instance_destroy();
}