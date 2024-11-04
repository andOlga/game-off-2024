///@description Rotate towards angle
if (
	sign(new_angle - image_angle) != move_direction
	|| move_direction = 0
) {
	image_index = 1
	alarm[2] = 30
} else {
	image_angle += 3*move_direction
	alarm[1] = 1
}