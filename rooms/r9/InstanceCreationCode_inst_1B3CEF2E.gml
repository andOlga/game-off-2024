room_goal = function () {
	var need_pressed = 3
	pressed_count = 0
	with (PressurePlate) {
		if (is_pressed) {
			other.pressed_count++
		}
	}
	return pressed_count == need_pressed
}