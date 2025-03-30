@icon("res://sprite_images/sGlove.png")

extends BaseItem

const beam_scene := preload("res://game_objects/interactives/glove/glove_beam.tscn")

func use() -> void:
	var have_boxes := false
	for child in $/root/Room.find_children("*"):
		if child is GloveBox and child.following:
			have_boxes = true
			child.following = null
			child.modulate = Color.WHITE
	if not have_boxes:
		for child in $/root/Room.find_children("*", "", true, false):
			if child is Player:
				var beam := beam_scene.instantiate()
				$/root/Room.add_child(beam)
				beam.shoot(child)
