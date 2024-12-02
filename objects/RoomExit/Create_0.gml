sound_has_played = false
finish_room = function () {
	InputController.set_cheats(false)
	if (room_get_name(room) == "r0") { // For debugging new rooms
		room_restart()
		return
	}
	if (room_goal()) {
		var current_room = real(string_replace(room_get_name(room), "r", ""))
		var room_idx = array_get_index(global.remaining_rooms, current_room)
		if (room_idx != -1) {
			array_delete(global.remaining_rooms, room_idx, 1)
		}
	}
	var rooms_left = array_length(global.remaining_rooms)
	if (rooms_left > 0) {
		var next_room = method_call(choose, global.remaining_rooms)
		room_goto(asset_get_index($"r{next_room}"))
	} else {
		room_goto(EndScreen)
	}
}

finish_rect_alpha = 0