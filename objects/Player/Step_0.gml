hspeed = global.input.dx
vspeed = global.input.dy
if (hspeed != 0 || vspeed != 0) {
	last_move = {dx: hspeed, dy: vspeed}
	speed = 3
} else {
	speed = 0
}