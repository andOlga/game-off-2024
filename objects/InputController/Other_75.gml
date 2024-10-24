///@description Gamepad connection check
if (async_load[? "event_type"] == "gamepad discovered") {
	var pad_idx = async_load[? "pad_index"]
	if (global.input.gp_idx == -1 || pad_idx < 4) { // prefer XInput controllers
		global.input.gp_idx = pad_idx
		if (get_timer() < 1_000_000) { // controller was plugged in at the start of the game
			window_set_fullscreen(true)
		}
	}
}

if (async_load[? "event_type"] == "gamepad lost") {
	global.input.gp_idx = -1
	if (!pause_gp_loss) {
		pause_gp_loss = true
		pause()
	}
}