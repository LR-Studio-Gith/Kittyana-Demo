global.cometa_layer = noone // All instances of the COMETA layer must be named similarly

/// In case anyone forgets to make all COMETA layers across every level to have the same name, this function can be run to hopefully find it, and is run within each COMETA toggle function.
function find_cometa(_fx = "_filter_pixelate") {
	var cometa = global.cometa_layer
	if cometa != noone and 
	fx_get_name(layer_get_fx(cometa)) == _fx return; 
	// Early exit if the COMETA layer is predefined and has the right effect.
	
	var layers = layer_get_all(); // Gets every layer
	// And then looks through all of them to find one with the right effect on it.
	for(var i = 0; i < array_length(layers); i ++) {
		var layer_fx = layer_get_fx(layers[i]);
   
		if (layer_fx != -1) and (fx_get_name(layer_fx) == _fx) {
			cometa = layer_fx;
		} else { // If it can't be found, set to noone/empty
			cometa = noone;
		}
		
		// Update cometa's id
		global.cometa_layer = cometa
	}
}

/// Activates the COMETA System's effect
function cometa_activate(_layer = global.cometa_layer){
	if _layer == noone {
		find_cometa() 
		_layer = global.cometa_layer;
	}
	
	layer_enable_fx(_layer, true)
}

/// Turns off COMETA's effect
function cometa_deactivate(_layer = global.cometa_layer){
	if _layer == noone {
		find_cometa() 
		_layer = global.cometa_layer;
	}

	layer_enable_fx(_layer, false)
}
