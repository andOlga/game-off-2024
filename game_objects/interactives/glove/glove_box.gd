@icon("res://sprite_images/sGloveBox.png")

class_name GloveBox extends CharacterBody2D

var following : Player = null

func _physics_process(_delta: float) -> void:
	if not following:
		return
	if global_position.distance_to(following.global_position) > 128:
		following = null
		modulate = Color.WHITE
		return
	velocity = following.velocity
	move_and_slide()
	var collision := get_last_slide_collision()
	if collision:
		var collider := collision.get_collider()
		if collider is Water:
			following = null
			hide()
			$BridgeSFX.play()
			collider.queue_free()
			if $BridgeSFX.playing:
				await $BridgeSFX.finished
			queue_free()
