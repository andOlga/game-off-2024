ready_for_input = true
hp = 3
is_hurting = false
reset_input = function(wait_time = 10) {
	ready_for_input = false
	alarm[0] = wait_time
}
last_move = {dx: 0, dy: -32}
instance_create_layer(x, y, "Instances", Sword)
hurt = function () {
	if (!is_hurting) {
		is_hurting = true
		hp--
		if (hp <= 0) {
			room_restart()
		} else {
			instance_create_depth(x, y, -100, HealthBar)
			alarm[1] = 60
		}
	}
}