///@description Update input variables

var get_buttons = function() {
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

var get_keys = function() {
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

var buttons = get_buttons()
var keys = get_keys()

global.input.a = buttons.a + keys.a
global.input.b = buttons.b + keys.b
global.input.adown = buttons.adown + keys.adown
global.input.bdown = buttons.bdown + keys.bdown
global.input.pause = buttons.pause + keys.pause
global.input.sel = buttons.sel + keys.sel
global.input.dx = clamp(buttons.dx + keys.dx, -1, 1)
global.input.dy = clamp(buttons.dy + keys.dy, -1, 1)

if ((buttons.debug + keys.debug) && debug_enable) {
	debug = !debug
	show_debug_overlay(debug)
}