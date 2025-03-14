extends CharacterBody2D

@export var has_sword := false

const hurt_sfx := preload("res://sounds/aHurt.wav")

@onready var can_swim := false
@onready var is_hurting := false
@onready var draws_grid := true
@onready var hp := 3
@onready var last_move := Vector2(0, 32)

func update_health_display():
	var hp_blends := [
		Color("FFA500"), # Orange, hp = 1
		Color("FFFF00"), # Yellow, hp = 2
		Color("008000"), # Green, hp = 3
	]
	$Sprite.modulate = hp_blends[hp - 1]

func hurt():
	if not is_hurting:
		$SoundEffect.stream = hurt_sfx
		$SoundEffect.play()
		is_hurting = true
		hp -= 1
		for i in Input.get_connected_joypads().size():
			Input.start_joy_vibration(i, 0.2, 0.2, 1)
		Input.vibrate_handheld(1000)
		if hp <= 0:
			$DeathTimer.start()
			$Sprite.hide()
		else:
			update_health_display()
			$InvisFrameTimer.start()
			$InvisBlinkTimer.start()

func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()

func _on_invis_frame_timer_timeout() -> void:
	is_hurting = false
	$InvisBlinkTimer.stop()
	$Sprite.modulate.a = 1

func _on_invis_blink_timer_timeout() -> void:
	if $Sprite.modulate.a == 1:
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1

func _ready() -> void:
	update_health_display()

func _draw() -> void:
	# TODO: draw grid
	pass

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down") * 3 * 60
	last_move = velocity
	move_and_slide()
