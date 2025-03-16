class_name BaseEnemy extends CharacterBody2D

func kill() -> void:
	hide()
	set_process(false)
	$DeathSFX.play()

func _on_death_sfx_finished() -> void:
	queue_free()
