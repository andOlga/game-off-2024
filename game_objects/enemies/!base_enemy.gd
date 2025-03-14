class_name BaseEnemy extends CharacterBody2D

func kill() -> void:
	$DeathSFX.play()
	queue_free()
