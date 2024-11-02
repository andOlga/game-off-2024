///@description Restore window size
ini_open("save.ini")
var s = "Window config"
window_set_fullscreen(ini_read_real(s, "fullscreen", 0))
window_set_size(
	ini_read_real(s, "width", 640),
	ini_read_real(s, "height", 480)
)
var winx = ini_read_real(s, "winx", -1)
var winy = ini_read_real(s, "winy", -1)
if (winx > -1 && winy > -1) {
	window_set_position(winx, winy)
}