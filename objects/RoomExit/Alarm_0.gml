///@description Finish the room
if (finish_rect_alpha < 1) {
	finish_rect_alpha += 0.1
	alarm[0] = 5
} else {
	finish_room()
}