///@description Auto-shoot
event_inherited()
var dx = player_instance.last_move.dx
var dy = player_instance.last_move.dy
if (dx != 0 && dy != 0) {
	instance_destroy()
}
if (dx < 0) {
	image_angle = 180
	y += 32
}
if (dy > 0) {
	image_angle = 270
	x += 32
}
if (dy < 0) {
	image_angle = 90
}
shoot({dx, dy})