extends BasePickup

const player_scene := preload("res://game_objects/player.tscn")

@export var give_swords := true

func activate(_activator: Player) -> void:
	for child in get_children():
		if child is MimicPotionTarget:
			var player := player_scene.instantiate()
			player.has_sword = give_swords
			player.global_position = child.global_position
			$/root/Room.call_deferred(&"add_child", player)
