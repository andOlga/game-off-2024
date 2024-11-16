timer_complete = false
call_later(9, time_source_units_seconds, method(self, function () {
	timer_complete = true
}))
room_goal = function () {
	return timer_complete
}