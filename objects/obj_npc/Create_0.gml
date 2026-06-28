talked_before = false;
talking = false;
current_text = 0;
skip_buffer = true;

function who_is_talking(cur_talker, talker_1=spr_uncle_calm, talker_2=spr_jinx_calm) {
	switch cur_talker {
		default:
			draw_sprite_stretched_ext(talker_1, 0, 800, 400, 200, 200, c_gray, 1);
			draw_sprite_stretched_ext(talker_2, 0, 260, 400, 200, 200, c_gray, 1);
		break;
		case 1:
			draw_sprite_stretched_ext(talker_1, 0, 800, 400, 200, 200, c_white, 1);
			draw_sprite_stretched_ext(talker_2, 0, 260, 400, 200, 200, c_gray, 1);
		break;
		case 2:
			draw_sprite_stretched_ext(talker_1, 0, 800, 400, 200, 200, c_gray, 1);
			draw_sprite_stretched_ext(talker_2, 0, 260, 400, 200, 200, c_white, 1);
		break;
	}
}

function create_dialog(name, dialog) {
	draw_set_colour(c_white)
	draw_text_transformed(260, 610, name, 0.5, 0.5, 0);
	if not is_array(dialog) {
		draw_text_transformed(260, 640, dialog, 0.5, 0.5, 0);
	} else {
		for (var i = 0; i < array_length(dialog); ++i) {
		    draw_text_transformed(260, 640+(30*i), dialog[i], 0.5, 0.5, 0);
		}
	}
}