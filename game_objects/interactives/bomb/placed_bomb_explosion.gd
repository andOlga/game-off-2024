@icon("res://sprite_images/sExplosion.png")

extends Node2D

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hurt()
	elif body is BaseEnemy:
		body.kill()
	elif body is CrackedWall:
		body.queue_free()

func _on_vaporize_timer_timeout() -> void:
	queue_free()
