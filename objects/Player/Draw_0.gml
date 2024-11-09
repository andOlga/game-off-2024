///@description Level grid
if (draws_grid) {
	for (var i = 0; i < room_width; i += 32) {
		for (var j = 0; j < room_height; j += 32) {
			draw_sprite(sGridSquare, 0, i, j)
		}
	}
}
draw_self()