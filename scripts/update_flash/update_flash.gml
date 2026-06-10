/**
 * In the Draw Event it updates the flash effect. 
 * @param {Asset} [targetted_object]=self | The object the flash affects
 * @param {Constant} [blending_mode]=bm_normal | Sometimes a different blending mode will produce a better effect. I recommend using bm_addition before you try some other ones.
 */
function update_flash(targetted_object = self, blending_mode = bm_normal) {
	var flash_time = set_flash_shader_color.flash_time
	if (flash_time >= 0)
	{
		gpu_set_blendmode(blending_mode); // Sets the blending mode
		
		
		shader_set(shd_flash); // Renders shader
		
		
		flash_shader_fade(flash_time);
		
		with targetted_object {
			draw_self(); // Draws the new flash sprite
		}
		
		shader_reset(); // "Removes" shader/returns sprite to normal on next draw
		gpu_set_blendmode(bm_normal); // Turns off blending
	
		set_flash_shader_color.flash_time -= 1/fps; // Decrement flash time by the fps rate
	}
}

