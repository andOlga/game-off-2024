room_goal = function () {
	return instance_number(BaseEnemy) == 0 && (
		ppRight.is_pressed
		&& !ppLeft.is_pressed
		&& !ppDown.is_pressed
		&& !ppUp.is_pressed
	)
}