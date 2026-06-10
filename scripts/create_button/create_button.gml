function create_button(x, y, width, height, text, text_color = c_black, hovering_text_color = c_grey){
	button = instance_create_depth(x, y, depth-1, obj_button)
	button.image_xscale = width
	button.image_yscale = height
	button.button_text = text
	button.text_color = text_color
	button.hovering_text_color = hovering_text_color
	
	return button
}