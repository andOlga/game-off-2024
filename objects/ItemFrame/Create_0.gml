have_items = false
sprite_index = sWall
items = []
current_item = -1

///@param {Id.Instance} item
add_item = function (item) {
	have_items = true
	sprite_index = sItemFrame
	array_push(items, item)
	current_item = array_length(items) - 1
	with (item) {
		x = -32
		y = -32
	}
}