///@description Pause message
if (paused) {
	var ih = get_input_hint(INPUT_GLYPHS.pause)
	var message = $"Game paused.\nPress {ih} to resume."
	if (pause_gp_loss) message = "Controller disconnected.\n" + message
	draw_text_centered(message)
}