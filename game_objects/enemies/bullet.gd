extends BaseEnemy

var is_moving := true

func _physics_process(_delta: float) -> void:
	if is_moving and move_and_collide(transform.x * 5):
		is_moving = false
		kill()
