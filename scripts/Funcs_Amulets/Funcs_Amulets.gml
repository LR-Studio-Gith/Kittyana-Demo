global.equipped_amulets = []

/// @desc Equips an amulet onto the player.
/// @param {Struct.Amulet} amulet The amulet to apply
/// @param {Real} pos An optional condition to place the amulet in a specific location in the equipped_amulets array
function equip_amulet(amulet, pos = array_length(global.equipped_amulets)-1) {
	pos = clamp(pos, 0, array_length(global.equipped_amulets));
	array_insert(global.equipped_amulets, pos, amulet);
	show_debug_message(amulet.name + " was equipped")
	amulet.ApplyModifiers();
}

/// @desc Removes an amulet from the player.
/// @param {Struct.Amulet} amulet The amulet to remove
function Funcs_Amulets(amulet) {
	if not array_length(global.equipped_amulets) > 0 {return} // Return early
	
	else {
		var _pos = undefined; // Init. value

		// Looks through an the equipped amulets list to find the matching amulet's index
		for (var i = 0; i < array_length(global.equipped_amulets); i++){
			// if it's found it, store the index in _pos
		    if (global.equipped_amulets[i] == amulet){ 
				_pos = i;
				global.equipped_amulets[i].RemoveModifiers()
				show_debug_message(amulet.name + " was unequipped from the player")
			}
		}
		
		array_delete(equipped_amulets, _pos, 1);
	}
}