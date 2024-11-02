if (global.input.dx != 0 && global.input.dy != 0) {
	speed = 0
}
else if (global.input.dx != 0) {
	hspeed = global.input.dx
	vspeed = 0
	last_move = {dx: hspeed, dy: 0}
	speed = 3
} else if (global.input.dy != 0) {
	vspeed = global.input.dy
	hspeed = 0
	last_move = {dx: 0, dy: vspeed}
	speed = 3
} else {
	speed = 0
}