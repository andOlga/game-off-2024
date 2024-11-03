have_items = false
items = []
current_item = -1

///@param {Id.Instance} item
add_item = function (item) {
	have_items = true
	array_push(items, item)
	current_item = array_length(items) - 1
	with (item) {
		x = -32
		y = -32
	}
}