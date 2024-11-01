text_alpha = 1
is_in_fade = false
var ihDpad = InputController.get_input_hint(INPUT_GLYPHS.dpad)
var ihA = InputController.get_input_hint(INPUT_GLYPHS.a)
var ihB = InputController.get_input_hint(INPUT_GLYPHS.b)
var ihPause = InputController.get_input_hint(INPUT_GLYPHS.pause)
var ihSel = InputController.get_input_hint(INPUT_GLYPHS.sel)
ini_open("save.ini")
var launchNums = ini_read_real("Save data", "launchNums", 0)
ini_write_real("Save data", "launchNums", min(13, launchNums + 1))
ini_close()
var o = "o"
for (var i = 0; i < launchNums; i++) {
	o += "o"
}
ihMessage = (
	  $"Controls:\n"
	+ $"Move: {ihDpad}\n"
	+ $"Use sw{o}rd: {ihA}\n"
	+ $"Use item: {ihB}\n"
	+ $"Change item: {ihSel}\n"
	+ $"Pause: {ihPause}\n"
	+ $"\n\nPress {ihPause} to begin."
)