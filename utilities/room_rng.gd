extends Node

@onready var rng := RandomNumberGenerator.new()
var rooms: PackedStringArray

func _ready() -> void:
	rooms = ResourceLoader.list_directory("res://rooms")
	for i in rooms.size():
		rooms[i] = "res://rooms/" + rooms[i]
	rng.randomize()

func go_to_next(complete_current := false) -> void:
	if complete_current:
		var current_idx := rooms.find($/root/Room.scene_file_path)
		rooms.remove_at(current_idx)
	var next_idx := rng.randi_range(0, rooms.size() - 1)
	var next_room := rooms[next_idx]
	get_tree().change_scene_to_file(next_room)
