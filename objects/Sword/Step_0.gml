if (is_flying) {
	x += flying_dirs.dx / 2
	y += flying_dirs.dy / 2
} else {
	var last_move = Player.last_move
	if (global.input.a) {
		is_flying = true
		flying_dirs = last_move
		exit
	}
	x = Player.x
	y = Player.y
	if (last_move.dx > 0) { // Right
		image_angle = 270
		x += 64
	} else if (last_move.dx < 0) { // Left
		image_angle = 90
		x -= 32
		y += 32
	} else if (last_move.dy > 0) { // Down
		image_angle = 180
		y += 64
		x += 32
	} else if (last_move.dy < 0) { // Up
		image_angle = 0
		y -= 32
	}
}