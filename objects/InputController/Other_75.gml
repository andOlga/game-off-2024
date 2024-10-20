///@description Gamepad connection check
if (async_load[? "event_type"] == "gamepad discovered") {
	global.input.gp_idx = async_load[? "pad_index"]
	if (get_timer() < 1_000_000) { // controller was plugged in at the start of the game
		window_set_fullscreen(true);
	}
}