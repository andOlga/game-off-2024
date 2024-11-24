///@description Clean up non-colliding carries
for (var i = 0; i < array_length(carries); i++) {
	var object = carries[i]
	if (
		!collision_rectangle(
			bbox_left, bbox_top, bbox_right, bbox_bottom,
			object, true, true
		)
	) {
		remove_carry(object)
	}
}