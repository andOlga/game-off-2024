if (can_move) {
	var move_amount = choose(-1, 1) * 32
	var move_direction = choose("x", "y")
	var this = self
	this[$ move_direction] += move_amount
	wait_for_turn(20)
}
event_inherited()