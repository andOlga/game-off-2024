extends RichTextLabel

var is_in_fade := false

func _ready() -> void:
	RoomManager.rng.randomize()
	$SeedBox.text = str(RoomManager.rng.seed)
	text = InputHinter.format_input_hint(text)
	
func _process(_delta: float) -> void:
	if not $SeedBox.has_focus():
		$SeedBox.grab_focus()
	if Input.is_action_just_pressed(&"action_pause") and not is_in_fade:
		is_in_fade = true
		var new_seed = $SeedBox.text
		if new_seed.length() > 0:
			if new_seed.is_valid_int():
				new_seed = int(new_seed)
			else:
				new_seed = hash(new_seed)
			RoomManager.rng.seed = new_seed
		$SeedBox.text = str(RoomManager.rng.seed)
		$FadeTimer.start()

func _on_fade_timer_timeout() -> void:
	if modulate.a <= 0:
		RoomManager.go_to_next()
	else:
		modulate.a -= 0.1
