draw_self()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_alpha(1)

if hovering {draw_set_colour(hover_text_color)} 
else {draw_set_colour(text_color)}

draw_text(x, y, button_text)