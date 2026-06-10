if not is_paused exit;

draw_set_alpha(0.5);
draw_set_colour(c_black);

draw_rectangle(0,0, window_get_width(), window_get_height(), false);
draw_set_alpha(1);

draw_set_colour(c_white)
draw_text(window_get_width()/2, window_get_height()/2, "GAME IS PAUSED");


// Draw Pause Menu
/*
Text up above that says "Paused"
Below that three buttons, Resume, Options, and Quit.
Options would then make more stuff appear, like Keybinds which would be another menu, 
Brightness which would take you to a slider menu, 
Window Size if that was as possible would show a drop down of select screen sizes. Prob dont need that one tho
and one more button that takes you back to the previous menu
*/

/*

resume_btn = createButton(x, y, size_x, size_y, "Resume")

resume_btn.on_click(function(){ 
	//Hide Menu 
})



menu = menu_manager.createMenu(pos_x, pos_y, spacing, ["Resume", "Options", "Quit"]) ==> returns a array
resume	= menu_manager.getButton(menu[0])
options	= menu_manager.getButton(menu[1])
quit	= menu_manager.getButton(menu[2])

options.on_press(function(){
	submenu_op = menu_manager.createSubMenu(menu, pos_x, pos_y, spacing, ["Keybinding", "Brightness", "Window Size"])
	keybinds = menu_manager.getButton(menu[0])
	...
	
	Submenu handles going back to the top of the menus by itself.
}) 

for (var i = 0; i < array_length(menu); ++i) {
	if pos == i {menu[i].text_color = c_yellow} else menu[i].text_color = c_white
}


pos += down_k - up_k
pos = (pos + op_length) mod op_length;


*/


_btn = instance_create_depth(20, 50, depth-1, obj_button)
_btn.button_size_x = 50;
_btn.button_size_y = 100;
_btn.button_text = "Resume"