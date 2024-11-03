room_goal = function () {
	pressed_count = 0
	with (PressurePlate) {
		if (is_pressed) {
			other.pressed_count++
		}
	}
	return pressed_count == 1 && instance_number(BaseEnemy) == 0
}