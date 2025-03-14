@icon("res://sprite_images/sBlob.png")

extends Node2D

@export var step_size := 32

func _on_movement_timer_timeout() -> void:
	var move_amount : int = [-1, 1].pick_random() * step_size
	var move_direction : StringName = [&"x", &"y"].pick_random()
	position[move_direction] += move_amount
