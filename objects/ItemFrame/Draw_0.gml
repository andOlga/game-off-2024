///@description Selected item

draw_self()

if (have_items) {
	draw_sprite_stretched(items[current_item].sprite_index, 0, x + 2, y + 2, 27, 27)
}
