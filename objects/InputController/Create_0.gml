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

// Helper functions used to populate the values in the struct above
get_buttons = function() {
	if (global.input.gp_idx >= 0) {
		return {
			a: gamepad_button_check_pressed(global.input.gp_idx, gp_face1),
			b: gamepad_button_check_pressed(global.input.gp_idx, gp_face2),
			adown: gamepad_button_check(global.input.gp_idx, gp_face1),
			bdown: gamepad_button_check(global.input.gp_idx, gp_face2),
			pause: gamepad_button_check_pressed(global.input.gp_idx, gp_start),
			sel: gamepad_button_check_pressed(global.input.gp_idx, gp_select),
			dx: (
				gamepad_button_check(global.input.gp_idx, gp_padr)
				- gamepad_button_check(global.input.gp_idx, gp_padl)
			),
			dy: (
				gamepad_button_check(global.input.gp_idx, gp_padd)
				- gamepad_button_check(global.input.gp_idx, gp_padu)
			),
			debug: gamepad_button_check_pressed(global.input.gp_idx, gp_shoulderl)
		}
	} else {
		return {
			a: 0,
			b: 0,
			adown: 0,
			bdown: 0,
			pause: 0,
			sel: 0,
			dx: 0,
			dy: 0,
			debug: 0
		}
	}
}

get_keys = function() {
	return {
		a: keyboard_check_pressed(ord("Z")),
		b: keyboard_check_pressed(ord("X")),
		adown: keyboard_check(ord("Z")),
		bdown: keyboard_check(ord("X")),
		pause: keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_escape),
		sel: keyboard_check_pressed(vk_space),
		dx: keyboard_check(vk_right) - keyboard_check(vk_left),
		dy: keyboard_check(vk_down) - keyboard_check(vk_up),
		debug: keyboard_check_pressed(ord("D"))
	}
}

// Debug functionality
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