extends CharacterBody2D

@onready var is_flying := false
var old_position : Vector2

func fire(new_velocity: Vector2) -> void:
	if new_velocity != Vector2.ZERO:
		$ShootSFX.play()
		old_position = position
		velocity = new_velocity
		is_flying = true

func rotate_to(new_directions: Vector2) -> void:
	if is_flying:
		return
	var dir_x := new_directions.x
	var dir_y := new_directions.y
	# Note: the numbers used below are "feels right" guesswork, they aren't supposed to make sense
	if dir_x > 0 and dir_y > 0: # Right-Down
		rotation_degrees = 45
		position = Vector2(40, 16)
	elif dir_x > 0 and dir_y < 0: # Right-Up
		rotation_degrees = -45
		position = Vector2(16, -10)
	elif dir_x < 0 and dir_y > 0: # Left-Down
		rotation_degrees = -225
		position = Vector2(16, 40)
	elif dir_x < 0 and dir_y < 0: # Left-Up
		rotation_degrees = -135
		position = Vector2(-11, 16)
	elif dir_x > 0: # Right
		rotation_degrees = 0
		position = Vector2(32, 0)
	elif dir_x < 0: # Left
		rotation_degrees = 180
		position = Vector2(0, 32)
	elif dir_y > 0: # Down
		rotation_degrees = -270
		position = Vector2(32, 32)
	elif dir_y < 0: # Up
		rotation_degrees = 270
		position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if is_flying:
		var collision := move_and_collide(velocity * delta)
		if collision:
			var collider := collision.get_collider()
			if collider is BaseEnemy:
				collider.kill()
			velocity = Vector2.ZERO
			position = old_position
			is_flying = false
