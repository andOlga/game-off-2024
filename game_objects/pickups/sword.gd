@icon("res://sprite_images/sSword.png")

extends BasePickup

func activate(activator: Player) -> void:
	activator.enable_sword()
