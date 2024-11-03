use = function () {
	with (Player) {
		instance_create_depth(x, y, depth - 1, PlacedBomb)
	}
}