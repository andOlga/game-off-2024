///@description Update input variables

var buttons = get_buttons()
var keys = get_keys()
var ls = get_ls()

global.input.a = buttons.a + keys.a
global.input.b = buttons.b + keys.b
global.input.adown = buttons.adown + keys.adown
global.input.bdown = buttons.bdown + keys.bdown
global.input.start = buttons.start + keys.start
global.input.sel = buttons.sel + keys.sel
global.input.dx = clamp(buttons.dx + keys.dx + ls.dx, -1, 1)
global.input.dy = clamp(buttons.dy + keys.dy + ls.dy, -1, 1)

if (buttons.debug + keys.debug) {
	with (DebugController) {
		toggle_overlay();
	}
}

if (global.input.start) {
	pause()
}