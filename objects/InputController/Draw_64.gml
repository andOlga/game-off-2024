///@description Pause message
if (paused) {
	var old_color = draw_get_color()
	draw_set_color(room == SandRoom ? #0072BC : c_white)
	var ihResume = get_input_hint(INPUT_GLYPHS.pause)
	var ihExit = get_input_hint(INPUT_GLYPHS.sel)
	var ihRestart = get_input_hint(INPUT_GLYPHS.b)
	var msg = $"Game paused.\nPress {ihResume} to resume.\nPress {ihRestart} to restart the room.\nPress {ihExit} to exit."
	if (pause_gp_loss) msg = "Controller disconnected.\n" + msg
	if (pause_roomno) {
		var roomno = string_replace(room_get_name(room), "r", "")
		msg = string_replace(msg, "Game paused.", $"You are in room #{roomno}.")
	}
	var old_va = draw_get_valign()
	var old_ha = draw_get_halign()
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(x, y, msg)
	draw_set_halign(old_ha)
	draw_set_valign(old_va)
	draw_set_color(old_color)
}