///@description Show control hints

var ihDpad = InputController.get_input_hint(INPUT_GLYPHS.dpad)
var ihA = InputController.get_input_hint(INPUT_GLYPHS.a)
var ihB = InputController.get_input_hint(INPUT_GLYPHS.b)
var ihPause = InputController.get_input_hint(INPUT_GLYPHS.pause)
var ihSel = InputController.get_input_hint(INPUT_GLYPHS.sel)
var message = $"Controls:\nMove: {ihDpad}\nAction 1: {ihA}\nAction 2: {ihB}\nPause: {ihPause}\nSel: {ihSel}"
message += $"\n\nPress {ihPause} to begin."
var oldHa = draw_get_halign()
var oldVa = draw_get_valign()
var oldAlpha = draw_get_alpha()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_alpha(text_alpha)
draw_text(x, y, message)
draw_set_alpha(oldAlpha)
draw_set_halign(oldHa)
draw_set_valign(oldVa)