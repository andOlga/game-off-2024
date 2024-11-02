if (other.is_flying) {
	other.is_flying = false
	instance_destroy()
} else {
	x = xprevious
	y = yprevious
	can_move = true
}