// Delete all buttons
for (var i = 0; i < op_length(); ++i) {
    instance_destroy(button[i])
}

// Remove the menu from the list of active menus
// In the lazy-est way possible
array_pop(global.Active_Menus)