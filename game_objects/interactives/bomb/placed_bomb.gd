@icon("res://sprite_images/sPlacedBomb.png")

extends Node2D

const explosion_scene := preload(
	"res://game_objects/interactives/bomb/placed_bomb_explosion.tscn"
)

func _on_init_timer_timeout() -> void:
	$ExplodeTimer.start()

func _on_explode_timer_timeout() -> void:
	if $Sprite.modulate.g8 > 0:
		$Sprite.modulate.g8 -= 25
	else:
		hide()
		var explosion = explosion_scene.instantiate()
		explosion.global_position = global_position
		$/root/Room.add_child(explosion)
		$ExplodeTimer.stop()
		$ExplodeSFX.play()

func _on_explode_sfx_finished() -> void:
	queue_free()
