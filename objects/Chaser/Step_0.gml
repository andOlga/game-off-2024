if (!instance_exists(Player)) exit
if (can_move) {
	image_index = 1
	mp_potential_step_object(Player.x, Player.y, 3, Wall)
} else {
	image_index = 0
}