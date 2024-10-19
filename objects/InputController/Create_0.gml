///@description Input variable setup

// This struct is meant to represent the same kind of inputs you would find on an NES controller.
// There is a D-Pad, A/B and Start/Select buttons.
// Nobody should ever need more inputs than these.
global.input = {
	dx: 0, // horizontal direction (right - left)
	dy: 0, // vertical direction (down - up)
	a: 0, // is "A" equivalent pressed just now
	b: 0, // is "B" equivalent pressed just now
	adown: 0, // is "A" equivalent being pressed currently
	bdown: 0, // is "B" equivalent being pressed currently
	pause: 0, // is "Start" equivalent pressed just now
	sel: 0, // is "Select" equivalent pressed just now
	gp_idx: -1 // current gamepad index
}

debug_enable = true; // Set to false to disable debug overlay
if (debug_enable) {
	dbg_view("Input", true, 500, 200)
	dbg_section("Input values")
	dbg_watch(ref_create(global.input, "dx"), "DX")
	dbg_watch(ref_create(global.input, "dy"), "DY")
	dbg_watch(ref_create(global.input, "adown"), "A")
	dbg_watch(ref_create(global.input, "bdown"), "B")
	dbg_section("Gamepad setup");
	dbg_watch(ref_create(global.input, "gp_idx"), "Current gamepad index");
	debug = false;
	show_debug_overlay(false);
}