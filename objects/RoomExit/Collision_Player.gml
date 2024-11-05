///@description Handle room exit
if (!sound_has_played) {
	sound_has_played = true
	if (room_goal()) {
		audio_play_sound(aExit, 1000, false, 1, 0, 1.5)
	} else {
		audio_play_sound(aExit, 1000, false, 1, 0, 0.2)
	}
}
instance_destroy(Sword)
alarm[0] = 5