draw_set_halign(fa_middle)

draw_set_colour(c_white)
draw_set_alpha(alpha)
draw_text(
	window_get_width()/2, (window_get_height()/2)-150,
	"GAME OVER"
)

alpha = Tween_Smooth(alpha, 1, 15)

draw_set_halign(fa_left)
