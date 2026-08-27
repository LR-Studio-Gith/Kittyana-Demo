global.equipped_amulets = []
global.gold_equipped_amulets = []

/// @desc Equips an amulet onto the player.
/// @param {Struct.Amulet} amulet The amulet to apply
function equip_amulet(amulet) {
	if !is_instanceof(amulet, GoldAmulet) { // If it isn't an golden amulet
		array_push(global.equipped_amulets, amulet);
	} else {
		array_push(global.gold_equipped_amulets, amulet);
	}
	show_debug_message(amulet.name + " was equipped")
	amulet.ApplyModifiers();
}

/// @desc Removes an amulet from the player.
/// @param {Struct.Amulet} amulet The amulet to remove
function unequip_amulet(amulet) {
	if not is_instanceof(amulet, GoldAmulet) { // If it isn't an golden amulet
		if array_length(global.equipped_amulets) > 0 {return}
	} 
	else {
		if array_length(global.gold_equipped_amulets) > 0 {return}
	}
	// Early exits

	var _pos = undefined; // Init. value

	// Regular amulet check
	if not is_instanceof(amulet, GoldAmulet) {
		// Looks through an the equipped amulets list to find the matching amulet's index
		for (var i = 0; i < array_length(global.equipped_amulets); i++){
			// if it's found it, store the index in _pos
			if (global.equipped_amulets[i] == amulet){ 
				_pos = i;
				global.equipped_amulets[i].RemoveModifiers()
				show_debug_message(amulet.name + " was unequipped from the player")
			}
		}
	} 
	
	// Gold amulet check
	else {
		// Looks through an the equipped amulets list to find the matching amulet's index
		for (var i = 0; i < array_length(global.gold_equipped_amulets); i++){
			// if it's found it, store the index in _pos
			if (global.gold_equipped_amulets[i] == amulet){ 
				_pos = i;
				global.gold_equipped_amulets[i].RemoveModifiers()
				show_debug_message(amulet.name + " was unequipped from the player")
			}
		}
	}
	
	array_delete(equipped_amulets, _pos, 1);
}