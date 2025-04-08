extends RichTextLabel

func _ready() -> void:
	text = text.format({
		"dpad": "\u21ce",
		"arrows": "\u23f4\u23f5\u23f6\u23f7",
		"a": "\u21a7",
		"key_z": "\uff3a",
		"b": "\u21a6",
		"key_x": "\uff38",
		"select": "\u21f7",
		"space": "\u243a",
		"start": "\u21f8",
		"enter": "\u242e",
		"esc": "\u242f"
	})
	hide()
	get_tree().paused = false

func _process(_delta: float) -> void:
	var scene_tree := get_tree()
	if scene_tree.paused:
		if Input.is_action_just_pressed("action_pause"):
			hide()
			scene_tree.paused = false
		elif Input.is_action_just_pressed("action_select"):
			scene_tree.quit()
		elif Input.is_action_just_pressed("action_item"):
			scene_tree.reload_current_scene()
	else:
		if Input.is_action_just_pressed("action_pause"):
			scene_tree.paused = true
			show()
