text_alpha = 1
is_in_fade = false
randomize()
seed = random_get_seed()
ini_open("save.ini")
var launchNums = ini_read_real("Save data", "launchNums", 0)
ini_write_real("Save data", "launchNums", min(13, launchNums + 1))
ini_close()
o = "o"
for (var i = 0; i < launchNums; i++) {
	o += "o"
}

///@param {real} seed
get_input_hint_message = function() {
	var ihDpad = InputController.get_input_hint(INPUT_GLYPHS.dpad)
	var ihA = InputController.get_input_hint(INPUT_GLYPHS.a)
	var ihB = InputController.get_input_hint(INPUT_GLYPHS.b)
	var ihPause = InputController.get_input_hint(INPUT_GLYPHS.pause)
	var ihSel = InputController.get_input_hint(INPUT_GLYPHS.sel)
	
	ihMessage = (
		  $"Controls:\n"
		+ $"Move: {ihDpad}\n"
		+ $"Use sw{o}rd: {ihA}\n"
		+ $"Use item: {ihB}\n"
		+ $"Change item: {ihSel}\n"
		+ $"Pause: {ihPause}\n\n"
		+ $"Seed (type a number to change):\n{seed}"
		+ $"\n\nPress {ihPause} to begin."
	)
	return ihMessage
}