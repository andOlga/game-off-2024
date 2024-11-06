for (var i = 0; i < array_length(visited_coords); i++) {
	draw_sprite_ext(
		sprite_index,
		image_index,
		visited_coords[i][0], visited_coords[i][1],
		1,
		1,
		image_angle,
		c_white,
		1.0
	)
}