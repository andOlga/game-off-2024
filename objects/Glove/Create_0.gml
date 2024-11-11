carries = []

use = function () {
	if (array_length(carries) > 0) {
		for (var i = 0; i < array_length(carries); i++) {
			uncarry(carries[i].box_id)
		}
	} else if (!instance_exists(GloveBeam)) {
		with (Player) {
			instance_create_depth(x, y, depth + 1, GloveBeam, {player_instance: id})
		}
	}
}

add_carry = function (box_id, player_instance_id) {
	array_push(carries, {box_id, player_instance_id})
	box_id.image_blend = #6DD0F7
}

uncarry = function (box_id) {
	var len = array_length(carries)
	for (var i = 0; i < len; i++) {
		if (carries[i].box_id == box_id) {
			box_id.image_blend = c_white
			box_id.speed = 0
			array_delete(carries, i, 1)
			break
		}
	}
}