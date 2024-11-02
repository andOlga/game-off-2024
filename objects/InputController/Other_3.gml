///@description Save window size
var window_data = {
	fullscreen: window_get_fullscreen(),
	width: window_get_width(),
	height: window_get_height(),
	winx: window_get_x(),
	winy: window_get_y()
}
ini_open("save.ini")
var s = "Window config"
var window_data_attrs = struct_get_names(window_data)
for (var i = 0; i < array_length(window_data_attrs); i++) {
	var attr = window_data_attrs[i]
	var value = window_data[$ attr]
	ini_write_real(s, attr, value)
}
ini_close()