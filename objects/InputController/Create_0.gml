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
	start: 0, // is Start equivalent being pressed currently
	sel: 0, // is "Select" equivalent pressed just now
	gp_idx: -1, // current gamepad index
}

paused = false // Is the game currently paused?
pause_gp_loss = false // Pause was due to gamepad loss

pause = function() {
	if (!paused) {
		instance_deactivate_all(true);
	} else {
		instance_activate_all();
		pause_gp_loss = false
	}
	paused = !paused
}

// Helper functions used to populate the values in the struct above
get_buttons = function() {
	return {
		a: gamepad_button_check_pressed(global.input.gp_idx, gp_face1),
		b: gamepad_button_check_pressed(global.input.gp_idx, gp_face2),
		adown: gamepad_button_check(global.input.gp_idx, gp_face1),
		bdown: gamepad_button_check(global.input.gp_idx, gp_face2),
		start: gamepad_button_check_pressed(global.input.gp_idx, gp_start),
		sel: gamepad_button_check_pressed(global.input.gp_idx, gp_select),
		dx: (
			gamepad_button_check(global.input.gp_idx, gp_padr)
			- gamepad_button_check(global.input.gp_idx, gp_padl)
		),
		dy: (
			gamepad_button_check(global.input.gp_idx, gp_padd)
			- gamepad_button_check(global.input.gp_idx, gp_padu)
		),
		debug: gamepad_button_check_pressed(global.input.gp_idx, gp_shoulderl),
	}
}

get_keys = function() {
	return {
		a: keyboard_check_pressed(ord("Z")),
		b: keyboard_check_pressed(ord("X")),
		adown: keyboard_check(ord("Z")),
		bdown: keyboard_check(ord("X")),
		start: keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_escape),
		sel: keyboard_check_pressed(vk_space),
		dx: keyboard_check(vk_right) - keyboard_check(vk_left),
		dy: keyboard_check(vk_down) - keyboard_check(vk_up),
		debug: keyboard_check_pressed(ord("D"))
	}
}

get_ls = function () { // Translate LS into D-Pad like inputs
	gamepad_set_axis_deadzone(global.input.gp_idx, 0.5)
	var dx = gamepad_axis_value(global.input.gp_idx, gp_axislh)
	var dy = gamepad_axis_value(global.input.gp_idx, gp_axislv)
	if (dx < 0) dx = -1
	if (dx > 0) dx = 1
	if (dy < 0) dy = -1
	if (dy > 0) dy = 1
	return { dx, dy }
}