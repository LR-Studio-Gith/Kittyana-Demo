var kb = 50
invincible = true
alarm_set(2, invincibility_duration.GetValue()*game_get_speed(gamespeed_fps))
vsp += kb*1.25
hsp += -sign(image_xscale) * kb
safety_respawn();