ready_for_input = true
reset_input = function(wait_time = 10) {
	ready_for_input = false
	alarm[0] = wait_time
}
last_move = {dx: 0, dy: -32}