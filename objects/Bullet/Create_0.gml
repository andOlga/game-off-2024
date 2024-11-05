event_inherited()
audio_play_sound(aShoot, 10, false, 1, 0, 1.5)
if (target_direction == "Towards Player") {
	direction = point_direction(x, y, Player.x, Player.y)
} else if (target_direction == "Random") {
	direction = irandom_range(0, 360)
} else if (target_direction == "As Specified") {
	direction = image_angle
}
image_angle = direction
speed = 10