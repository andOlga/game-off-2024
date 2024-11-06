use = function () {
	if (!instance_exists(GrappleBeam)) {
		with (Player) {
			instance_create_depth(x, y, depth + 1, GrappleBeam, {player_instance: id})
		}
	}
}