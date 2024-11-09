///@description Restore window size, set audio volume
audio_master_gain(0.1)
ini_open("save.ini")
var s = "Window config"
window_set_fullscreen(ini_read_real(s, "fullscreen", 0))
window_set_size(
	ini_read_real(s, "width", room_width),
	ini_read_real(s, "height", room_height)
)
var winx = ini_read_real(s, "winx", -1)
var winy = ini_read_real(s, "winy", -1)
if (winx > -1 && winy > -1) {
	window_set_position(winx, winy)
}
ini_close()