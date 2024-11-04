total_enemies = instance_number(BaseEnemy)
flyers = instance_number(Flyer) // this only makes sense if all flyers stay BELOW the room divider
other_enemies = total_enemies - flyers
room_goal = function () {
	return instance_number(BaseEnemy) == other_enemies && instance_number(Flyer) == 0
}