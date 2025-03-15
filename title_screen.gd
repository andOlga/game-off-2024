extends RichTextLabel

var is_in_fade := false

func _process(delta: float) -> void:
	if not $SeedBox.has_focus():
		$SeedBox.grab_focus()
	if Input.is_action_just_pressed("action_pause") and not is_in_fade:
		is_in_fade = true
		$FadeTimer.start()

func _on_fade_timer_timeout() -> void:
	if modulate.a <= 0:
		get_tree().change_scene_to_file("res://test_scene.tscn")
	else:
		modulate.a -= 0.1
