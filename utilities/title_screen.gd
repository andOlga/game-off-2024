extends RichTextLabel

var is_in_fade := false

func _ready() -> void:
	$SeedBox.text = str(RoomRng.rng.seed)
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
	
func _process(_delta: float) -> void:
	if not $SeedBox.has_focus():
		$SeedBox.grab_focus()
	if Input.is_action_just_pressed("action_pause") and not is_in_fade:
		is_in_fade = true
		var new_seed = $SeedBox.text
		if new_seed.length() > 0:
			if new_seed.is_valid_int():
				new_seed = int(new_seed)
			else:
				new_seed = hash(new_seed)
			RoomRng.rng.seed = new_seed
		$SeedBox.text = str(RoomRng.rng.seed)
		$FadeTimer.start()

func _on_fade_timer_timeout() -> void:
	if modulate.a <= 0:
		RoomRng.go_to_next()
	else:
		modulate.a -= 0.1
