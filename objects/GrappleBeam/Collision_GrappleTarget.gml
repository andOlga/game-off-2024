with (GrappleTargetSquare) {
	if (target_square_id == other.target_square_id) {
		other.player_instance.x = x
		other.player_instance.y = y
		break
	}
}
instance_destroy()