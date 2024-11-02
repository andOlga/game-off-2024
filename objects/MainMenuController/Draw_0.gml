///@description Show control hints

var oldHa = draw_get_halign()
var oldVa = draw_get_valign()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x, y, get_input_hint_message())
draw_set_halign(oldHa)
draw_set_valign(oldVa)