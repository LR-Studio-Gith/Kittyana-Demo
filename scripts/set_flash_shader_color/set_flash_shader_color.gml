/**
 * Sets the color of the flash shader (0-255)
 * @param {Color} [color]=#FFFFFF | Flash color
 */ 
function set_flash_shader_color(color = #FFFFFF)
{
	static flash_time = 0
	static r = colour_get_red(color)
	static g = colour_get_green(color)
	static b = colour_get_blue(color)
}
