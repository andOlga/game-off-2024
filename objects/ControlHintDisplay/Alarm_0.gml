///@description Fade out and transition room

if (text_alpha <= 0) {
	with (InputController) {
		can_pause = true
	}
	room_goto(next_room)
} else {
	text_alpha -= fade_by
	alarm[0] = 1
}