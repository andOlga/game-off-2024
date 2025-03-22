@icon("res://sprite_images/sTurretOn.png")

extends BaseEnemy

@export_enum(
	"As specified", # 0
	"Towards player" # 1
) var target_direction := 0

const bullet_scene := preload("res://game_objects/enemies/bullet.tscn")
const enabled_tex := preload("res://sprite_images/sTurretOn.png")
const disabled_tex := preload("res://sprite_images/sTurretOff.png")

func _on_spin_timer_timeout() -> void:
	# TODO: actual spinny stuff
	$Sprite.texture = enabled_tex
	$FireTimer.start()

func _on_fire_timer_timeout() -> void:
	var bullet := bullet_scene.instantiate()
	bullet.global_transform = global_transform
	get_parent().add_child(bullet)
	$Sprite.texture = disabled_tex
	$SpinTimer.start()
