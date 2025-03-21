@icon("res://sprite_images/sKey.png")

extends BasePickup

func activate(activator: Player) -> void:
	for door in get_children():
		if door is Door:
			door.queue_free()
