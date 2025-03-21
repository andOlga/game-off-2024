@icon("res://sprite_images/sPotionHealth.png")

extends BasePickup

func activate(activator: Player) -> void:
	activator.hp = 3
	activator.update_health_display()
