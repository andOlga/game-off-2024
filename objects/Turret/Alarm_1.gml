///@description Rotate towards angle
if (
	sign(new_angle - image_angle) != move_direction
	|| target_direction == "As Specified"
) {
	image_index = 1
	alarm[2] = 30
} else {
	image_angle += 3*move_direction
	alarm[1] = 1
}