have_flyers = instance_number(Flyer)
have_turrets = instance_number(Turret)
room_goal = function () {
	return (
		instance_number(Key) == 1
		&& instance_number(Turret) == have_turrets
		&& instance_number(Flyer) == have_flyers
		&& instance_number(Hopper) == 0
		&& instance_number(Chaser) == 0
	)
}