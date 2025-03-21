@icon("res://sprite_images/sPotionInvuln.png")

extends BasePickup

func activate(activator: Player) -> void:
	activator.is_hurting = true
	activator.get_node("Sprite").modulate = Color("00FFFF")
