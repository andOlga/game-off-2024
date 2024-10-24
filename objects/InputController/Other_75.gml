///@description Gamepad disconnect check

if (async_load[? "event_type"] == "gamepad lost") {
	if (!pause_gp_loss) {
		pause_gp_loss = true
		pause()
	}
}