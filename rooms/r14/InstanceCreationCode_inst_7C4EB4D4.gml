have_chasers = instance_number(Chaser)
have_hoppers = instance_number(Hopper)
room_goal = function () {
	return (
		instance_number(Key) == 1
		&& instance_number(Turret) == 0
		&& instance_number(Flyer) == 0
		&& instance_number(Hopper) == have_hoppers
		&& instance_number(Chaser) == have_chasers
	)
}