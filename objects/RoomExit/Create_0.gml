if (!variable_global_exists("remaining_rooms")) {
	global.remaining_rooms = []
	for (var i = 1; i <= 9999; i++) {
		if (asset_get_index($"r{i}") != -1) {
			array_push(global.remaining_rooms, i)
		}
	}
}

finish_room = function () {
	if (room_goal()) {
		var current_room = real(string_replace(room_get_name(room), "r", ""))
		var room_idx = array_get_index(global.remaining_rooms, current_room)
		if (room_idx != -1) {
			array_delete(global.remaining_rooms, room_idx, 1)
		}
	}
	var rooms_left = array_length(global.remaining_rooms)
	if (rooms_left > 0) {
		var next_room = global.remaining_rooms[irandom_range(1, rooms_left) - 1]
		room_goto(asset_get_index($"r{next_room}"))
	} else {
		room_goto(EndScreen)
	}
}

finish_rect_alpha = 0