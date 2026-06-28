// Bar background
draw_set_colour(c_black)
draw_roundrect(
spacing_x, pos_y, 
pos_x, pos_y - width, 
false)

// Actual bar
draw_set_colour(c_red)
draw_roundrect(
spacing_x, pos_y, 
lerp(spacing_x, pos_x, percent()), 
pos_y - width, 
false)

// Boss title text
draw_set_font(fnt_menu)
draw_set_colour(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text( 
pos_x/2, 
pos_y - width/2, 
"Till the Dill King Snake")