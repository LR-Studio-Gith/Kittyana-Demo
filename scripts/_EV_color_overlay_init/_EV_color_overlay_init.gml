///@description Set up necessary variables to the shader
///_EV_color_overlay_init( c_color)
function _EV_color_overlay_init() {
	sh_co_upixel_colorR = shader_get_uniform( sh_color_overlay, "pixel_colorR");
	sh_co_upixel_colorG = shader_get_uniform( sh_color_overlay, "pixel_colorG");
	sh_co_upixel_colorB = shader_get_uniform( sh_color_overlay, "pixel_colorB");
	sh_co_upixel_colorBl= shader_get_uniform( sh_color_overlay, "pixel_AlphaBlend");
	sh_co_upixel_imgA	= shader_get_uniform( sh_color_overlay, "image_alpha");

	//VARIABLE COLOR
	sh_co_color = c_white;


}
