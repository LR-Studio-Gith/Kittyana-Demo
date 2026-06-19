max_hp = obj_pickle_boss._health
cur_hp = max_hp

spacing_x = 50
spacing_y = 70
width = 80

pos_x = window_get_width() - spacing_x
pos_y = window_get_height() - spacing_y

percent = function(){return obj_pickle_boss._health/max_hp}

if not audio_group_is_loaded(audiogroup_music) {
	audio_group_load(audiogroup_music) 
}

boss_music = audio_play_sound(snd_pickle_boss, 5, true)