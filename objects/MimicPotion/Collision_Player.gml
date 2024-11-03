with (MimicPotionTarget) {
	if (target_id == other.target_id) {
		var player_instance = instance_create_layer(
			x, y,
			"Instances",
			Player,
			{has_sword: other.give_swords}
		)
		player_instance.draws_grid = false
	}
}
instance_destroy()