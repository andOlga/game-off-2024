extends Node2D

var fade_direction := 1

func _ready() -> void:
	modulate.a8 = 0
	$FadeTimer.start()

func _on_fade_timer_timeout() -> void:
	modulate.a8 += 10 * fade_direction
	if modulate.a8 >= 255:
		$WaitTimer.start()
		$FadeTimer.stop()
	elif modulate.a8 <= 0:
		get_tree().change_scene_to_file("res://utilities/title_screen.tscn")

func _on_wait_timer_timeout() -> void:
	fade_direction = -1
	$FadeTimer.start()
