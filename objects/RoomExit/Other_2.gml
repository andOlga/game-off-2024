///@description Set up room pool
var max_rooms = 9999 // The maximum number of rooms the game will scan for.
global.remaining_rooms = []
for (var i = 1; i <= max_rooms; i++) {
	if (asset_get_index($"r{i}") != -1) {
		array_push(global.remaining_rooms, i)
	}
}