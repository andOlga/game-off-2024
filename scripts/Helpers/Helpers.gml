/// @param {string} message
function draw_text_centered(message) {
	draw_text(
		(window_get_width() - string_width(message)) / 2,
		(window_get_height() - string_height(message)) / 2,
		message
	);
}

enum INPUT_GLYPHS {
	dpad, a, b, pause, sel
}

/**
@description Draws an input hint at the specified position
@param {real} xpos
@param {real} ypos
@param {real} glyph
*/
function draw_input_hint(xpos, ypos, glyph) {
	var old_font = draw_get_font()
	var old_color = draw_get_color()
	var old_alpha = draw_get_alpha()
	draw_set_font(PromptFont)
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
	draw_text(xpos, ypos, prompt_text)
	draw_set_font(old_font)
	draw_set_color(old_color)
	draw_set_alpha(old_alpha)
}