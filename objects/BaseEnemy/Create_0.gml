can_move = true
can_swim = false
old_x = x
old_y = y
wait_for_turn = function (frames) {
	can_move = false
	alarm[0] = frames
}