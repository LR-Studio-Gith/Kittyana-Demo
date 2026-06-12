if font != noone {draw_set_font(font);}
draw_set_valign(fa_top); draw_set_halign(fa_left);


if not mouse_enter {
	draw_set_colour(c_white);
} else {
	draw_set_colour(c_yellow);
}

draw_text(
x + obj_menu.border_margin, // Pushes text to not be so close to the edge
y + obj_menu.border_margin,
text
)