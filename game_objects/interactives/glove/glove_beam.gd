extends CharacterBody2D

var launcher: Player
var is_shooting := false

func shoot(new_launcher: Player):
	launcher = new_launcher
	global_position = launcher.global_position
	var direction := launcher.last_move
	if direction.x != 0 and direction.y != 0:
		return
	if direction.x < 0: # Left
		rotation_degrees = 180
		position += Vector2(0, 32)
	elif direction.y > 0: # Down
		rotation_degrees = -270
		position += Vector2(32, 32)
	elif direction.y < 0:
		rotation_degrees = 270
	$ShootSFX.play()
	is_shooting = true

func _physics_process(delta: float) -> void:
	if global_position.distance_to(launcher.global_position) > 64:
		if $ShootSFX.playing:
			hide()
			await $ShootSFX.finished
		queue_free()
	else:
		var collision := move_and_collide(transform.x * delta * 500)
		if collision:
			var collider := collision.get_collider()
			if collider is GloveBox:
				collider.following = launcher
				collider.modulate = Color.AQUA
			if $ShootSFX.playing:
				hide()
				await $ShootSFX.finished
			queue_free()
