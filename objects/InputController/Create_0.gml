///@description Input init

#region Pause
paused = false // Is the game currently paused?
pause_gp_loss = false // Was pause due to gamepad loss?

pause = function() {
	if (!can_pause) {
		return
	}
	if (!paused) {
		instance_deactivate_all(true);
	} else {
		instance_activate_all();
		pause_gp_loss = false
	}
	paused = !paused
}
#endregion

#region Input handling
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
	start: 0, // is Start equivalent being pressed just now
	sel: 0, // is "Select" equivalent pressed just now
}

// Helper functions used to populate the values in the struct above
get_buttons = function() {
	var gp_count = gamepad_get_device_count()
	var retval = {
		a: 0, b: 0, adown: 0, bdown: 0,
		start: 0, sel: 0, dx: 0, dy: 0,
		debug: 0
	}
	for (var gp_idx = 0; gp_idx < gp_count; gp_idx++) {
		if (!gamepad_is_connected(gp_idx)) {
			continue
		}
		retval = {
			a: gamepad_button_check_pressed(gp_idx, gp_face1),
			b: gamepad_button_check_pressed(gp_idx, gp_face2),
			adown: gamepad_button_check(gp_idx, gp_face1),
			bdown: gamepad_button_check(gp_idx, gp_face2),
			start: gamepad_button_check_pressed(gp_idx, gp_start),
			sel: gamepad_button_check_pressed(gp_idx, gp_select),
			dx: (
				gamepad_button_check(gp_idx, gp_padr)
				- gamepad_button_check(gp_idx, gp_padl)
			),
			dy: (
				gamepad_button_check(gp_idx, gp_padd)
				- gamepad_button_check(gp_idx, gp_padu)
			),
			debug: gamepad_button_check_pressed(gp_idx, gp_shoulderl),
		}
		var gamepad_was_in_use = false
		var gamepad_vars = struct_get_names(retval)
		for (var i = 0; i < array_length(gamepad_vars); i++) {
			if (retval[$ gamepad_vars[i]] != 0) {
				gamepad_was_in_use = true
				break
			}
		}
		if (gamepad_was_in_use) {
			break
		}
	}
	return retval
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
		debug: keyboard_check_pressed(ord("D")),
	}
}

get_ls = function () { // Translate LS into D-Pad like inputs
	var retval = {dx: 0, dy: 0}
	var gp_count = gamepad_get_device_count()
	for (var gp_idx = 0; gp_idx < gp_count; gp_idx++) {
		if (!gamepad_is_connected(gp_idx)) {
			continue
		}
		gamepad_set_axis_deadzone(gp_idx, 0.5)
		var dx = gamepad_axis_value(gp_idx, gp_axislh)
		var dy = gamepad_axis_value(gp_idx, gp_axislv)
		if (dx < 0) dx = -1
		if (dx > 0) dx = 1
		if (dy < 0) dy = -1
		if (dy > 0) dy = 1
		if (dx != 0 || dy != 0) {
			retval = {dx, dy}
			break
		}
	}
	return retval
}

vibrate = function(frames, strength) {
	var gp_count = gamepad_get_device_count()
	for (var gp_idx = 0; gp_idx < gp_count; gp_idx++) {
		gamepad_set_vibration(gp_idx, strength, strength)
		alarm[0] = frames
	}
}
#endregion

#region Input hints
enum INPUT_GLYPHS {
	dpad, a, b, pause, sel
}

///@description Gets input hint text (in PromptFont) for a glyph.
///				The hint text combines all relevant controller and keyboard icons.
///				If there are more than 2 icons, the first two will be separated with `sep1`.
///				In all other cases, `sep` is used to separate them.
///@param {real} glyph
///@param {string} sep
///@param {string} sep1
get_input_hint = function(glyph, sep = " or ", sep1 = ", ") {
	if (glyph == INPUT_GLYPHS.dpad) {
		return $"\u21ce{sep1}\u21cb{sep}\u23f6\u23f7\u23f4\u23f5" // D-pad, LS or arrows
	} else if (glyph == INPUT_GLYPHS.a) {
		return $"\u21a7{sep}\uff3a" // Button A or Key Z
	} else if (glyph == INPUT_GLYPHS.b) {
		return $"\u21a6{sep}\uff38" // Button B or Key X
	} else if (glyph == INPUT_GLYPHS.pause) {
		return $"\u21f8{sep1}\u242e{sep}\u242f" // Start, Enter or Escape
	} else if (glyph == INPUT_GLYPHS.sel) {
		return $"\u21f7{sep}\u243a" // Select or Space
	}
}
#endregion