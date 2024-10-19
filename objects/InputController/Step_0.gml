///@description Update input variables

var get_buttons = function() {
	if (global.gp_idx >= 0) {
		return {
			a: gamepad_button_check_pressed(global.gp_idx, gp_face1),
			b: gamepad_button_check_pressed(global.gp_idx, gp_face2),
			pause: gamepad_button_check_pressed(global.gp_idx, gp_start),
			dx: (
				gamepad_button_check(global.gp_idx, gp_padr)
				- gamepad_button_check_pressed(global.gp_idx, gp_padl)
			),
			dy: (
				gamepad_button_check(global.gp_idx, gp_padd)
				- gamepad_button_check(global.gp_idx, gp_padu)
			)
		}
	} else {
		return {
			a: 0,
			b: 0,
			pause: 0,
			dx: 0,
			dy: 0
		}
	}
}

var get_keys = function() {
	return {
		a: keyboard_check_pressed(ord("Z")),
		b: keyboard_check_pressed(ord("X")),
		pause: keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_escape),
		dx: keyboard_check(vk_right) - keyboard_check(vk_left),
		dy: keyboard_check(vk_down) - keyboard_check(vk_up)
	}
}

var buttons = get_buttons()
var keys = get_keys()

global.input.a = buttons.a + keys.a
global.input.b = buttons.b + keys.b
global.input.pause = buttons.pause + keys.pause
global.input.dx = clamp(buttons.dx + keys.dx, -1, 1)
global.input.dy = clamp(buttons.dy + keys.dy, -1, 1)