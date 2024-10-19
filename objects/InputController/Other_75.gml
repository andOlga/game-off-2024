///@description Gamepad connection check
if (async_load[? "event_type"] == "gamepad discovered") {
	global.input.gp_idx = async_load[? "pad_index"]
}