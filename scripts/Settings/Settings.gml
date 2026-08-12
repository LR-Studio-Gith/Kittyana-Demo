global.GAME_SETTINGS = {
	// Audio
	Master_Volume	: 100,
	Music_Volume	: 100,
	SFX_Volume		: 100,
	
	FREE_AIM		: false,
	RUNTYPE			: false, // temp
	
}

global.isRunning = false;

function update_settings() {
	#region Audio [ALWAYS REMEMBER TO DIVIDE BY 100]
	// For ALL Audio
	audio_master_gain(global.GAME_SETTINGS.Master_Volume / 100)
	
	// For Music
	audio_group_set_gain(audiogroup_music, global.GAME_SETTINGS.Music_Volume / 100)

	// For Sound Effects
	audio_group_set_gain(audiogroup_sfx, global.GAME_SETTINGS.SFX_Volume / 100)
	#endregion
	
	#region more settings would prob go down from here
	#endregion
}