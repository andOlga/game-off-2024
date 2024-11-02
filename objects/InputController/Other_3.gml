///@description Save window size
var fs = window_get_fullscreen()
var width = window_get_width()
var height = window_get_height()
var winx = window_get_x()
var winy = window_get_y()
ini_open("save.ini")
var s = "Window config"
ini_write_real(s, "fullscreen", fs)
ini_write_real(s, "width", width)
ini_write_real(s, "height", height)
ini_write_real(s, "winx", winx)
ini_write_real(s, "winy", winy)
ini_close()