///@description Fade room out
draw_self()
var old_alpha = draw_get_alpha()
var old_color = draw_get_color()
var new_color = c_black
if (room != MainMenu) {
	new_color = room_goal() ? c_green : c_red
}
draw_set_alpha(finish_rect_alpha)
draw_set_color(new_color)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_color(old_color)
draw_set_alpha(old_alpha)