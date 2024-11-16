room_goal = function () {
	with (PressurePlate) {
		if (!is_pressed) {
			return false
		}
	}	
	return instance_number(BaseEnemy) == 0
}