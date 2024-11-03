///@description Exit transition
rect_alpha += 0.01
if (rect_alpha >= 1) {
	game_restart()
} else {
	alarm[1] = 2
}