var blinker = call_later(30, time_source_units_frames, function () {
	layer_set_visible("ExitLabels", !layer_get_visible("ExitLabels"))
}, true)
call_later(300, time_source_units_frames, method({blinker}, function () {
	call_cancel(blinker)
	layer_destroy("ExitLabels")
}))