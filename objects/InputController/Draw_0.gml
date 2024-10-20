///@description Pause message
if (paused) {
	var message = "Game paused."
	if (pause_gp_loss) message = "Controller disconnected. " + message
	draw_text_centered(message)
}