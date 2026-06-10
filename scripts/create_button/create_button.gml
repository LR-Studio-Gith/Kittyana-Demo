function create_button(x, y, width, height, text, text_color = c_black, hovering_text_color = c_gray){
	button = instance_create_depth(x, y, depth-1, obj_button)
	button.button_text = text
	
	button.image_xscale = width*(string_length(text)*(button.sprite_width/string_length(text)))
	button.image_yscale = height*(string_height(text)/button.sprite_height)
	
	button.text_color = text_color
	button.hover_text_color = hovering_text_color
	
	return button
}