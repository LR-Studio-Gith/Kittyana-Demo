/**
 * [SYSTEM USAGE ONLY, DO NOT USE] | Updates the shader's alpha, creating the fading effect of the flash
 * @param {Real} [alpha]=1.0 Transparency Channel
 */
function flash_shader_fade(alpha)
{
	shd_red = shader_get_uniform(shd_flash, "_red");
	shd_green = shader_get_uniform(shd_flash, "_green");
	shd_blue = shader_get_uniform(shd_flash, "_blue");
	shd_alpha = shader_get_uniform(shd_flash, "_alpha");

	shader_set_uniform_f(shd_red, set_flash_shader_color.r);
	shader_set_uniform_f(shd_green, set_flash_shader_color.g);
	shader_set_uniform_f(shd_blue, set_flash_shader_color.b);
	shader_set_uniform_f(shd_alpha, alpha);
}