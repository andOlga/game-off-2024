/// @param {string} message
function draw_text_centered(message) {
	draw_text(
		(window_get_width() - string_width(message)) / 2,
		(window_get_height() - string_height(message)) / 2,
		message
	);
}