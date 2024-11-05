if (has_sword) {
	var sword = instance_create_layer(x, y, "Instances", Sword)
	sword.player_instance = id
}
can_swim = false
last_move = {dx: 0, dy: -32} // Set up sword position
hp = 3
is_hurting = false
update_health_display = function () {
	var hp_blends = [c_orange, c_yellow, c_green]
	image_blend = hp_blends[hp - 1]
}
hurt = function () {
	if (!is_hurting) {
		audio_play_sound(aHurt, 200, false)
		is_hurting = true
		hp--
		InputController.vibrate(60, 0.2)
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
draws_grid = true