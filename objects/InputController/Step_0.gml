///@description Input update

var buttons = get_buttons()
var keys = get_keys()
var ls = get_ls()

global.input.a = buttons.a + keys.a
global.input.b = buttons.b + keys.b
global.input.adown = buttons.adown + keys.adown
global.input.bdown = buttons.bdown + keys.bdown
global.input.start = buttons.start + keys.start
global.input.sel = buttons.sel + keys.sel
global.input.dx = clamp(buttons.dx + keys.dx + ls.dx, -1, 1)
global.input.dy = clamp(buttons.dy + keys.dy + ls.dy, -1, 1)

if (global.input.start || os_is_paused()) {
	pause()
}

if (paused && global.input.sel) {
	game_end()
}

#region Cheats
if (keyboard_check_released(vk_tab)) {
	set_cheats(!cheats_enabled)
}
if (cheats_enabled) {
	keyboard_string = string_upper(keyboard_string) // workaround for YoYoGames/GameMaker-Bugs#6877
	#region Room select
	var pos_engage = string_last_pos("ENGAGE", keyboard_string)
	var pos_r = 0
	if (pos_engage > 0) {
		pos_r = string_pos_ext("TH", keyboard_string, pos_engage)
		if (pos_r > 0) {
			var room_number = string_digits(string_copy(keyboard_string, pos_engage, pos_r - pos_engage))
			set_cheats(false)
			var cheat_room = asset_get_index($"r{room_number}")
			if (cheat_room != -1) {
				call_later(60, time_source_units_frames, method(
					{cheat_room},
					function () {
						room_goto(cheat_room)
					}
				))
			}
		}
	}
	#endregion
	#region Invulnerability mode
	var pos_bh = string_last_pos("BOTHERHAM", keyboard_string)
	if (pos_bh > 0) {
		set_cheats(false)
		with (Player) {
			is_hurting = true // bodge infinite invis frames
			image_blend = c_aqua
		}
		with (MimicPotion) {
			ham_bothered = true
		}
	}
	#endregion
	#region Skip to credits
	var pos_df = string_last_pos("DINNAEFANCY", keyboard_string)
	if (pos_df > 0) {
		set_cheats(false)
		room_goto(EndScreen)
	}
	#endregion
	#region Room number display
	var pos_whereami = string_last_pos("WHEREAMI", keyboard_string)
	if (pos_whereami > 0) {
		set_cheats(false)
		pause_roomno = true
		pause()
	}
	#endregion
}
#endregion