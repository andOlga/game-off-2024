event_inherited()
var dx = player_instance.last_move.dx
var dy = player_instance.last_move.dy
if (dx != 0 && dy != 0) {
	instance_destroy()
}
if (dy != 0) {
	image_angle = 90
}
if (dy > 0) {
	y += 32
}
visited_coords = []
collided_target_id = -1
shoot(player_instance.last_move)