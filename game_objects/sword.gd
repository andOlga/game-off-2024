extends CharacterBody2D

@onready var is_flying := false
var old_position : Vector2

func fire(velocity):
	if velocity != Vector2.ZERO:
		old_position = position
		self.velocity = velocity
		is_flying = true
	
func rotate_to(velocity):
	# TODO: determine new angle and position using velocity vector
	pass
	
func _physics_process(delta: float) -> void:
	if is_flying:
		var collision := move_and_collide(velocity * delta)
		if collision:
			var collider := collision.get_collider()
			if collider is BaseEnemy:
				$KillSFX.play()
				collider.queue_free()
			velocity = Vector2.ZERO
			position = old_position
			is_flying = false
