carries = []

///@param {Id.Instance} object
add_carry = function (object) {
	with (object) {
		if (object_index == GloveBox) {
			image_blend = c_red
			speed = 0
		}
		gravity = other.pull_strength
		gravity_direction = other.image_angle
	}
	array_push(carries, object)
}

///@param {Id.Instance} object
remove_carry = function (object) {
	for (var i = 0; i < array_length(carries); i++) {
		if (carries[i] == object) {
			with (object) {
				gravity = 0
				if (object_index == GloveBox) {
					image_blend = c_white
				}
			}
			array_delete(carries, i, 1)
			break
		}
	}
}