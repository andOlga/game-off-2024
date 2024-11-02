///@description Show control hints

var oldHa = draw_get_halign()
var oldVa = draw_get_valign()
var oldAlpha = draw_get_alpha()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_alpha(text_alpha)
draw_text(x, y, get_input_hint_message())
draw_set_alpha(oldAlpha)
draw_set_halign(oldHa)
draw_set_valign(oldVa)