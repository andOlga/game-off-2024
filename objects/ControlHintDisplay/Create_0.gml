text_alpha = 1
is_in_fade = false
ihDpad = InputController.get_input_hint(INPUT_GLYPHS.dpad)
ihA = InputController.get_input_hint(INPUT_GLYPHS.a)
ihB = InputController.get_input_hint(INPUT_GLYPHS.b)
ihPause = InputController.get_input_hint(INPUT_GLYPHS.pause)
ihSel = InputController.get_input_hint(INPUT_GLYPHS.sel)
message = (
	$"Controls:\nMove: {ihDpad}\nAction 1: {ihA}\nAction 2: {ihB}\nPause: {ihPause}\nSel: {ihSel}"
	+ $"\n\nPress {ihPause} to begin."
)