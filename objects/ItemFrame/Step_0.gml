///@description Item-related inputs

if (!have_items) {
	exit
}

if (global.input.sel) {
	current_item = (current_item + 1) % array_length(items)
}

if (global.input.b) {
	items[current_item].use()
}