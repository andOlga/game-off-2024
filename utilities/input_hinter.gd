extends Node

func format_input_hint(text: String) -> String:
	return text.format({
		"dpad": "\u21ce",
		"left_stick": "\u21CB",
		"arrows": "\u23f4\u23f5\u23f6\u23f7",
		"button_a": "\u21a7",
		"key_z": "\uff3a",
		"button_b": "\u21a6",
		"key_x": "\uff38",
		"select": "\u21f7",
		"space": "\u243a",
		"start": "\u21f8",
		"enter": "\u242e",
		"esc": "\u242f"
	})
