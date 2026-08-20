/*
- Darken screen
*/

alpha = 0;

show_debug_message("game over")

menu = create_menu(spr_menu,
[obj_pause_restart_1, obj_pause_quit_1],
0, 0, 40, 80
)

menu.stay_centered = false;


og_room = global.og_room