is_pressed = false

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
}