@icon("res://sprite_images/sGrapple.png")

extends BaseItem

const beam_scene := preload("res://game_objects/interactives/grapple/grapple_beam.tscn")

func use() -> void:
	for child in $/root/Room.find_children("*", "", true, false):
		if child is Player:
			var beam := beam_scene.instantiate()
			$/root/Room.add_child(beam)
			beam.shoot(child)
