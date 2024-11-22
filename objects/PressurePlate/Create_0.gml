is_pressed = false
pressed_before = false
// Feather disable once GM1044
door_color = door_color & 0xFFFFFF // discard alpha

///@param {bool} state
///@param {bool} force
set_pressed = function (state, force = false) {
	if (!state && (!stays_on || force)) { // Plates that "stay on" cannot be toggled off unless forced
		is_pressed = false
		image_index = 0
	} else if (state) {
		is_pressed = true
		image_index = 1
	}
	
	with (Door) {
		if (image_blend == other.door_color) {
			is_open = other.is_pressed
		}
	}
}