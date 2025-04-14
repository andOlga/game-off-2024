extends Node

const SAVE_PATH := "user://remaining_rooms.json"
@onready var rng := RandomNumberGenerator.new()
var rooms: PackedStringArray

func _ready() -> void:
	var have_rooms = false
	if FileAccess.file_exists(SAVE_PATH):
		var save := FileAccess.open(SAVE_PATH, FileAccess.READ)
		rooms = JSON.parse_string(save.get_line())
		save.close()
		if not rooms.is_empty():
			have_rooms = true
	if not have_rooms:
		rooms = ResourceLoader.list_directory("res://rooms")
		for i in rooms.size():
			rooms[i] = "res://rooms/" + rooms[i]
		_save_remaining_rooms()

func wipe_save() -> void:
	DirAccess.remove_absolute(SAVE_PATH)
	_ready()
	get_tree().change_scene_to_file("res://utilities/title_screen.tscn")

func _save_remaining_rooms() -> void:
	var save := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	save.store_line(JSON.stringify(rooms))
	save.close()

func go_to_next(complete_current := false) -> void:
	if complete_current:
		var current_idx := rooms.find($/root/Room.scene_file_path)
		rooms.remove_at(current_idx)
		_save_remaining_rooms()
	if rooms.is_empty():
		_ready() # Re-initialize the global state
		get_tree().change_scene_to_file("res://utilities/credits.tscn")
	else:
		var next_idx := rng.randi_range(0, rooms.size() - 1)
		var next_room := rooms[next_idx]
		get_tree().change_scene_to_file(next_room)
