///@description Wait for Start, set seed

if (is_in_fade) {
	exit
}

if (global.input.start) {
	is_in_fade = true
	random_set_seed(seed)
	InputController.can_pause = true
	var roomZero = asset_get_index("r0")
	if (roomZero != -1) {
		room_goto(roomZero)
	} else {
		RoomExit.alarm[0] = 5
	}
}

keyboard_string = string_copy(string_digits(keyboard_string), 1, 16)
if (keyboard_string != "") {
	seed = real(keyboard_string)
} else {
	seed = random_get_seed()
}