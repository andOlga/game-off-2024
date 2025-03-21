class_name BasePickup extends Node2D

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		global_position = Vector2(-32, -32)
		activate(body)
		$PickupSFX.play()

func _on_pickup_sfx_finished() -> void:
	queue_free()

func activate(activator: Player) -> void:
	push_error("Tried to activate() unimplemented pickup")
