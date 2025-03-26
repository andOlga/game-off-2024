@icon("res://sprite_images/sBomb.png")

extends BaseItem

const placed_bomb_scene := preload(
	"res://game_objects/interactives/bomb/placed_bomb.tscn"
)

func use() -> void:
	for child in $/root/Room.find_children("*", "", true, false):
		if child is Player:
			var placed_bomb := placed_bomb_scene.instantiate()
			placed_bomb.global_position = child.global_position
			$/root/Room.add_child(placed_bomb)
