global.GAME_SETTINGS = {
	Master_Volume	: 100,
	Music_Volume	: 100,
	SFX_Volume		: 100,
}


function update_settings() {
	#region Audio
	
	// Easiest one T_T
	// For ALL Audio
	audio_master_gain(global.GAME_SETTINGS.Master_Volume / 100)
	
	// For Music
	audio_group_set_gain(audiogroup_music, global.GAME_SETTINGS.Music_Volume / 100)
	//for (var i = 0; i < array_length(mus); ++i) {
	//	var mus_track = asset_get_index(mus[i])
	//	if mus_track != -1 and audio_emitter_exists(mus_track) {
	//		audio_emitter_gain(mus_track, global.GAME_SETTINGS.Music_Volume / 100)
	//	} else {
	//		show_debug_message("--Error: music track not found--")
	//	}
	//}

	// For Sound Effects
	audio_group_set_gain(audiogroup_sfx, global.GAME_SETTINGS.SFX_Volume / 100)
	//var sfx = tag_get_assets("sfx")
	//for (var i = 0; i < array_length(sfx); ++i) {
	//	var sfx_track = asset_get_index(sfx[i])
	//	if sfx_track != -1 and audio_emitter_exists(sfx_track) {
	//		audio_emitter_gain(sfx_track, global.GAME_SETTINGS.SFX_Volume / 100)
	//	} else {
	//		show_debug_message("--Error: sound effect not found--")
	//	}
	//}
	#endregion
	
	#region more settings would prob go down from here
	#endregion
}