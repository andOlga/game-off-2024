text_alpha = 1
is_in_fade = false
var ihDpad = InputController.get_input_hint(INPUT_GLYPHS.dpad)
var ihA = InputController.get_input_hint(INPUT_GLYPHS.a)
var ihB = InputController.get_input_hint(INPUT_GLYPHS.b)
var ihPause = InputController.get_input_hint(INPUT_GLYPHS.pause)
var ihSel = InputController.get_input_hint(INPUT_GLYPHS.sel)
ihMessage = (
	$"Controls:\nMove: {ihDpad}\nAction 1: {ihA}\nAction 2: {ihB}\nPause: {ihPause}\nSel: {ihSel}"
	+ $"\n\nPress {ihPause} to begin."
)