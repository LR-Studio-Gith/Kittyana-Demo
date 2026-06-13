///@description Defines the color and the alpha blend that will be used by the shader
///_EV_color_overlay_set_color( color, overlay alpha, image_alpha)
///@param c_color
///@param overlay_alpha
///@param image_alpha*
function _EV_color_overlay_set_color() {

	if shader_is_compiled( sh_color_overlay)
	{
		//Shader set color
		var v_c = argument[0];
	
		shader_set_uniform_f( sh_co_upixel_colorR,	color_get_red( v_c)*0.003921568);
		shader_set_uniform_f( sh_co_upixel_colorG,	color_get_green( v_c)*0.003921568);
		shader_set_uniform_f( sh_co_upixel_colorB,	color_get_blue( v_c)*0.003921568);
		shader_set_uniform_f( sh_co_upixel_colorBl, argument[1]);
	
		if (argument_count > 2)
		{
			shader_set_uniform_f( sh_co_upixel_imgA,	argument[2]);
		}
		else
		{
			shader_set_uniform_f( sh_co_upixel_imgA,	argument[0]);
		}
	
		//Return Positive
		return 1;
	}
	else
	{
		//Return failed
		return 0;
	}


}
