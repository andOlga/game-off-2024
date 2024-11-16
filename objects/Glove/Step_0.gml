///@description Move carried boxes

for (var i = 0; i < array_length(carries); i++) {
	var carry = carries[i]
	if (
		!instance_exists(carry.box_id)
		|| !instance_exists(carry.player_instance_id)
		|| point_distance(
			carry.box_id.x,
			carry.box_id.y,
			carry.player_instance_id.x,
			carry.player_instance_id.y
		) > 64
	) {
		uncarry(carry.box_id)
		continue
	}
	carry.box_id.direction = carry.player_instance_id.direction
	carry.box_id.speed = carry.player_instance_id.speed
}