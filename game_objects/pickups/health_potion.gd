@icon("res://sprite_images/sPotionHealth.png")

extends BasePickup

func activate(activator: Player) -> void:
	if not activator.is_invuln:
		activator.hp = 3
		activator.update_health_display()
