@icon("res://sprite_images/sBlob.png")

extends BaseEnemy

@export var step_size := 32

func _on_movement_timer_timeout() -> void:
	var move_amount : int = [-1, 1].pick_random() * step_size
	var move_direction : StringName = [&"x", &"y"].pick_random()
	velocity[move_direction] = move_amount * 3600

func _physics_process(delta: float) -> void:
	velocity *= delta
	if move_and_slide():
		_on_movement_timer_timeout()
	velocity = Vector2(0, 0)
