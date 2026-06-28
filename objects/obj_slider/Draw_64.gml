draw_self();
draw_set_font(fnt_menu)
var knob_amount = amount_current/amount_max;
var knob_position_x = x + (sprite_width * knob_amount)

if sprite_get_number(knob_sprite) > 1 {
	draw_sprite(knob_sprite, is_being_dragged, knob_position_x, y)
	// techinally your not supposed to use bools like numbers
	// but idgaf rn
} else {
	draw_sprite(knob_sprite, 0, knob_position_x, y)
}

draw_set_valign(fa_center);
// Percentage
if is_being_dragged {draw_set_colour(hover_color)} 
else {draw_set_colour(text_color)}
draw_set_halign(fa_left);
draw_text(x + sprite_width + padding, y, round(amount_current));

// Text
draw_set_colour(_color)
draw_set_halign(fa_right);
draw_text(x-padding, y, slider_text);




// Testing 
//draw_set_valign(fa_top); draw_set_halign(fa_left);
//draw_rectangle(top_left_x(), top_left_y(), bottom_right_x(), bottom_right_y(), true)