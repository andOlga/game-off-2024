if (is_flying) {
	hspeed = flying_dirs.dx
	vspeed = flying_dirs.dy
	speed = 16
} else {
	speed = 0
	var last_move = player_instance.last_move
	if (global.input.a) {
		is_flying = true
		flying_dirs = {dx: last_move.dx, dy: last_move.dy}
		exit
	}
	x = player_instance.x
	y = player_instance.y
	
	// Note: the numbers used below are "feels right" guesswork, they aren't supposed to make sense
	if (last_move.dx > 0 && last_move.dy > 0) { // Right-Down
		image_angle = 270 + 45
		x += 40
		y += 16
	} else if (last_move.dx > 0 && last_move.dy < 0) { // Right-Up
		image_angle = 90 - 45
		x += 16
		y -= 10
	} else if (last_move.dx < 0 && last_move.dy > 0) { // Left-Down
		image_angle = 270 - 45
		x += 16
		y += 40
	} else if (last_move.dx < 0 && last_move.dy < 0) { // Left-Up
		image_angle = 90 + 45
		y += 16
		x -= 11
	} else if (last_move.dx > 0) { // Right
		image_angle = 0
		x += 32
	} else if (last_move.dx < 0) { // Left
		image_angle = 180
		y += 32
	} else if (last_move.dy > 0) { // Down
		image_angle = 270
		x += 32
		y += 32
	} else if (last_move.dy < 0) { // Up
		image_angle = 90
	}
}