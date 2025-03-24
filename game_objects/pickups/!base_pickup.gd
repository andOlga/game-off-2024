class_name BasePickup extends Node2D

var activated := false

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Player and not activated:
		hide()
		activated = true
		activate(body)
		$PickupSFX.play()

func _on_pickup_sfx_finished() -> void:
	queue_free()

func activate(activator: Player) -> void:
	push_error("Tried to activate() unimplemented pickup @", self, " by ", activator)
