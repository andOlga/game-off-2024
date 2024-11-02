///@description Wait for Start, set seed

if (is_in_fade) {
	exit
}

if (global.input.start) {
	random_set_seed(seed)
	is_in_fade = true
	alarm[0] = 1
}

keyboard_string = string_copy(string_digits(keyboard_string), 1, 16)
if (keyboard_string != "") {
	seed = real(keyboard_string)
} else {
	seed = random_get_seed()
}