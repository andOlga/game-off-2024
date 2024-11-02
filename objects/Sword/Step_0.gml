if (is_flying) {
	hspeed = flying_dirs.dx
	vspeed = flying_dirs.dy
	speed = 16
} else {
	speed = 0
	var last_move = Player.last_move
	if (global.input.a) {
		is_flying = true
		flying_dirs = {dx: last_move.dx, dy: last_move.dy}
		exit
	}
	x = Player.x
	y = Player.y
	if (last_move.dx > 0) { // Right
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