///@description Toggle when stepped on
if (stays_on && pressed_before) {
	exit
}
var pressed = place_meeting(x, y, [Player, GloveBox])
set_pressed(pressed)
if (pressed != pressed_before) {
	pressed_before = pressed
	audio_play_sound(aToggle, 10, false, 1, 0, pressed ? 1.5 : 1.0)
}