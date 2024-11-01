///@description Fade out and transition room

if (text_alpha <= 0) {
	with (InputController) {
		can_pause = true
	}
	var roomZero = asset_get_index("r0")
	room_goto(roomZero != -1 ? roomZero : next_room)
} else {
	text_alpha -= fade_by
	alarm[0] = 1
}