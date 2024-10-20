/// @param {string} message
function draw_text_centered(message) {
	var old_va = draw_get_valign()
	var old_ha = draw_get_halign()
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(
		view_wport[0] / 2,
		view_hport[0] / 2,
		message
	);
	draw_set_halign(old_ha)
	draw_set_valign(old_va)
}