///@Description draws a sprite with a given color overlaying it
///draw_sprite_ext_color_overlay( sprite_index, image_index, x, y, xscale, yscale, angle, alpha, color_overlay, color_overlay_alpha)
///@param sprite_index
///@param image_index
///@param x
///@param y
///@param xscale
///@param yscale
///@param angle
///@param alpha
///@param color_overlay
///@param color_overlay_alpha
function draw_sprite_ext_color() {

	//Check if it is initialized
	if (!variable_instance_exists( id, "sh_co_color"))
	{
		_EV_color_overlay_init();
	}

	//Proceed
	if (shader_is_compiled(sh_color_overlay))
	{
		//Setting up shader
		shader_set(sh_color_overlay);
		_EV_color_overlay_set_color( argument[8], argument[9], argument[7]);

		//Draw sprite ext
		draw_sprite_ext( argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], c_white, 1);

		//Reseting shader
		shader_reset();
	
		//Return success
		return 1;
	}
	else
	{
		//Failed
		return 0;
	}


}
