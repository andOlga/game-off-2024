if (!is_lit) {
	var old_color = draw_get_color()
	var old_alpha = draw_get_alpha()
	draw_set_color(c_black)
	draw_set_alpha(darkness_level)
	draw_rectangle(0, 0, room_width, room_height, false)
	draw_set_color(old_color)
	draw_set_alpha(old_alpha)
}
draw_self()