debug_enable = true // Is debugging enabled at all?
debug = false // Is debugging currently on?

if (debug_enable) {
	dbg_view("Input", true, 100, 100, 400, 200)
	dbg_section("Input values")
	dbg_watch(ref_create(global.input, "dx"), "DX")
	dbg_watch(ref_create(global.input, "dy"), "DY")
	dbg_watch(ref_create(global.input, "adown"), "A")
	dbg_watch(ref_create(global.input, "bdown"), "B")
	dbg_section("Gamepad setup")
	dbg_watch(ref_create(global.input, "gp_idx"), "Current gamepad index")
	show_debug_overlay(false)
}

toggle_overlay = function () {
	debug = !debug
	show_debug_overlay(debug_enable && debug)
}