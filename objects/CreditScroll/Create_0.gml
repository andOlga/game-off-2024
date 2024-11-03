InputController.can_pause = false
text_y = 500
rect_alpha = 0
credits_text = ""
var credits_file = file_text_open_read("credits.txt")
while (!file_text_eof(credits_file)) {
	credits_text += file_text_readln(credits_file)
}
file_text_close(credits_file)
credits_text = string_replace(credits_text, "{GM_VERSION}", GM_runtime_version)
text_min_y = -string_height(credits_text)
alarm[0] = 30