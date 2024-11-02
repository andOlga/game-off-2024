///@description Fade room out
draw_self()
var old_alpha = draw_get_alpha()
var old_color = draw_get_color()
draw_set_alpha(finish_rect_alpha)
draw_set_color(c_black)
draw_rectangle(0, 0, 640, 480, false)
draw_set_color(old_color)
draw_set_alpha(old_alpha)