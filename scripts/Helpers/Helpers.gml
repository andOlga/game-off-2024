/// @param {string} message
function draw_text_centered(message) {
	var old_va = draw_get_valign()
	var old_ha = draw_get_halign()
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(
		view_wport[0] / 2,
		view_hport[0] / 2,
		message
	);
	draw_set_halign(old_ha)
	draw_set_valign(old_va)
}

enum INPUT_GLYPHS {
	dpad, a, b, pause, sel
}

/**
@description Gets the text representation (in PromptFont) of the input hint
@param {real} glyph
*/
function get_input_hint(glyph) {
	var prompt_text = ""
	if (glyph == INPUT_GLYPHS.dpad) {
		prompt_text = "\u21ce or \u21cb or \u23f4\u23f5\u23f6\u23f7"
	} else if (glyph == INPUT_GLYPHS.a) {
		prompt_text = "\u21a7 or \uff3a"
	} else if (glyph == INPUT_GLYPHS.b) {
		prompt_text = "\u21a6 or \uff38"
	} else if (glyph == INPUT_GLYPHS.pause) {
		prompt_text = "\u21f8 or \u242e or \u242f"
	} else if (glyph == INPUT_GLYPHS.sel) {
		prompt_text = "\u21f7 or \u243a"
	}
	return prompt_text
}