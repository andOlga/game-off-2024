extends Node

const SAVE_PATH := "user://save.json"
@onready var rng := RandomNumberGenerator.new()
var rooms: PackedStringArray

func _ready() -> void:
	var have_rooms = false
	if FileAccess.file_exists(SAVE_PATH):
		var save_data := JSON.parse_string(
			FileAccess.get_file_as_string(SAVE_PATH)
		) as Dictionary
		rooms = save_data.remaining_rooms
		rng.seed = save_data.rng_seed
		if OS.get_name() != "Web":
			rng.state = save_data.rng_state
		if not rooms.is_empty():
			have_rooms = true
	if not have_rooms:
		rooms = ResourceLoader.list_directory("res://rooms")
		for i in rooms.size():
			rooms[i] = "res://rooms/" + rooms[i]
		_save_game(rng.state)

func wipe_save() -> void:
	DirAccess.remove_absolute(SAVE_PATH)
	rng.randomize()
	_ready()

func _save_game(rng_state: int) -> void:
	var save := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	save.store_line(JSON.stringify({
		"rng_seed": rng.seed,
		"rng_state": rng_state,
		"remaining_rooms": rooms
	}, " "))
	save.close()

func go_to_next(complete_current := false) -> void:
	var prev_rng_state := rng.state
	if complete_current:
		var current_idx := rooms.find($/root/Room.scene_file_path)
		rooms.remove_at(current_idx)
	if rooms.is_empty():
		wipe_save()
		get_tree().change_scene_to_file("res://utilities/credits.tscn")
	else:
		var next_idx := rng.randi_range(0, rooms.size() - 1)
		var next_room := rooms[next_idx]
		_save_game(prev_rng_state)
		get_tree().change_scene_to_file(next_room)
