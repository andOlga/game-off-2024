is_lit = false
depth = -9999

use = function () {
	if (!is_lit) {
		is_lit = true
		alarm[0] = light_duration
		if (deal_damage_on_use) {
			with (Player) {
				is_hurting = true
				instance_create_depth(x - 32, y - 32, depth + 1, PlacedBombExplosion)
			}
			alarm[1] = 10
		}
	}
}