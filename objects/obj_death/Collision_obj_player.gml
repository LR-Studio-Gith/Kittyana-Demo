if not _hit {
	other.hp--;
	other.hsp = (other.hsp+(other.image_xscale*(push_f*30)))
	other.vsp = -push_f
	
	_hit = true
}

alarm_set(0, 10)