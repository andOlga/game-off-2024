@icon("res://sprite_images/sFish.png")

extends BasePickup

func activate(activator: Player) -> void:
	activator.enable_swim()
