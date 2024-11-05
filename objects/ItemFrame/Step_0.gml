///@description Item-related inputs

if (!have_items) {
	exit
}

if (global.input.sel) {
	current_item = (current_item + 1) % array_length(items)
}

if (global.input.b) {
	audio_play_sound(aItem, 10, false, 1, 0, 3.0)
	items[current_item].use()
}