extends RichTextLabel

func _ready() -> void:
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
