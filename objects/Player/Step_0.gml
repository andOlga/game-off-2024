if (ready_for_input) {
	if (!(global.input.dx != 0 && global.input.dy != 0)) { // Orthogonal movement only pls
		x += global.input.dx * 32
		y += global.input.dy * 32
		if (xprevious != x || yprevious != y) {
			last_move.dx = x - xprevious
			last_move.dy = y - yprevious
			reset_input()
		}
	}
}