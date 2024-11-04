///@description Determine new angle
if (target_direction == "Towards Player") {
	new_angle = point_direction(x, y, Player.x, Player.y)
} else if (target_direction == "Random") {
	new_angle = irandom_range(0, 360)
}
if (target_direction == "As Specified") {
	move_direction = 0
} else {
	move_direction = sign(new_angle - image_angle)
}
alarm[1] = 1