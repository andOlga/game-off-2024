///@description Set up room pool
global.remaining_rooms = []
for (var i = 1; i <= 9999; i++) {
	if (asset_get_index($"r{i}") != -1) {
		array_push(global.remaining_rooms, i)
	}
}