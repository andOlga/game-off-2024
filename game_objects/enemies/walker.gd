@icon("res://sprite_images/sChaserOff.png")

extends Path2D

@export var speed := 0.3
const sprites := {
	-1: preload("res://sprite_images/sChaserOn.png"),
	1: preload("res://sprite_images/sChaserOff.png")
}

func _process(delta: float) -> void:
	$Follower.progress_ratio += speed * delta
	if $Follower.progress_ratio == 1.0 or $Follower.progress_ratio == 0.0:
		speed = -speed
		$Follower/WalkerInternal.get_node("Sprite").texture = sprites[int(sign(speed))]

func _on_walker_internal_tree_exiting() -> void:
	queue_free()
