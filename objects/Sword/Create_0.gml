is_flying = false
flying_dirs = {dx: 0, dy: 0}

shoot = function (dirs) {
	is_flying = true
	flying_dirs = {dx: dirs.dx, dy: dirs.dy}
}