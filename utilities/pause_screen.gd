extends RichTextLabel

func _ready() -> void:
	if OS.get_name() != "Web":
		text += tr("\nPress {select} or {space} to exit.")
	text = InputHinter.format_input_hint(text)
	hide()
	get_tree().paused = false

func _process(_delta: float) -> void:
	var scene_tree := get_tree()
	if scene_tree.paused:
		if Input.is_action_just_pressed(&"action_pause"):
			hide()
			scene_tree.paused = false
		elif Input.is_action_just_pressed(&"action_select"):
			if OS.get_name() != "Web":
				scene_tree.quit()
		elif Input.is_action_just_pressed(&"action_item"):
			scene_tree.reload_current_scene()
		elif Input.is_action_just_pressed(&"action_sword"):
			scene_tree.paused = false
			RoomManager.wipe_save()
	else:
		if Input.is_action_just_pressed(&"action_pause"):
			scene_tree.paused = true
			show()
