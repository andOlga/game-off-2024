room_goal = function () {
	with (PressurePlate) {
		if (!is_pressed) {
			return false
		}
	}
	return true
}