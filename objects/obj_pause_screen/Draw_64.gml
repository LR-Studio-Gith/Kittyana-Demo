if not is_paused exit;

// Draw background
draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(0,0, window_get_width(), window_get_height(), false);
draw_set_alpha(1);

// Draw text

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_alpha(1);
draw_set_colour(c_white)
draw_text(
	window_get_width()/2,
	( (window_get_height()/2) - menu_height ) -50, 
	"GAME IS PAUSED"
);
