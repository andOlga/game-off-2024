event_inherited()
if (target_direction == "Towards Player") {
	direction = point_direction(x, y, Player.x, Player.y)
} else if (target_direction == "Random") {
	direction = irandom_range(0, 360)
} else if (target_direction == "As Specified") {
	direction = image_angle
}
image_angle = direction
speed = 10