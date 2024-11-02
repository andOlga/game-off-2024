instance_create_layer(x, y, "Instances", Sword)
last_move = {dx: 0, dy: -32} // Set up sword position
hp = 3
is_hurting = false
update_health_display = function () {
	var hp_blends = [c_orange, c_yellow, c_green]
	image_blend = hp_blends[hp - 1]
}
hurt = function () {
	if (!is_hurting) {
		is_hurting = true
		hp--
		InputController.vibrate(60, 0.5)
		if (hp <= 0) {
			call_later(120, time_source_units_frames, room_restart)
			instance_destroy(Sword)
			image_alpha = 0
		} else {
			update_health_display()
			alarm[1] = 60
			alarm[2] = 5
		}
	}
}
update_health_display()