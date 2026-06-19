max_hp = obj_pickle_boss._health
cur_hp = max_hp

spacing_x = 50
spacing_y = 70
width = 80

pos_x = window_get_width() - spacing_x
pos_y = window_get_height() - spacing_y

percent = function(){return obj_pickle_boss._health/max_hp}
