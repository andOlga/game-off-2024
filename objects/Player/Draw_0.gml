///@description Level grid
if (draws_grid) {
	for (var i = 0; i < 640; i += 32) {
		for (var j = 0; j < 480; j += 32) {
			draw_sprite(sGridSquare, 0, i, j)
		}
	}
}
draw_self()