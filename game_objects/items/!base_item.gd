class_name BaseItem extends Node2D

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player:
		$PickupSFX.play()
		$"..".add_item(self)
		global_position = Vector2(-32, -32)

func use() -> void:
	push_error("Tried to activate item with unimplemented use()")
