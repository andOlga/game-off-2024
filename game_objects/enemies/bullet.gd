@icon("res://sprite_images/sBullet.png")

extends BaseEnemy

var is_moving := true

func _physics_process(_delta: float) -> void:
	if is_moving:
		var collision := move_and_collide(transform.x * 5)
		if collision:
			var collider := collision.get_collider()
			if collider is CrackedWall:
				collider.queue_free()
			is_moving = false
			kill()
