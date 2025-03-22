@icon("res://sprite_images/sTurretOn.png")

extends BaseEnemy

@export_enum(
	"As specified", # 0
	"Towards player", # 1
	"Random" # 2
) var target_direction := 0

const bullet_scene := preload("res://game_objects/enemies/bullet.tscn")
const enabled_tex := preload("res://sprite_images/sTurretOn.png")
const disabled_tex := preload("res://sprite_images/sTurretOff.png")
@onready var first_player: Player = $"../Player/Chara"

func _on_spin_timer_timeout() -> void:
	$Sprite.texture = enabled_tex
	if target_direction == 1:
		look_at(first_player.global_position + Vector2(16, 16))
	elif target_direction == 2:
		look_at(Vector2(
			randi_range(0, 640),
			randi_range(0, 480)
		))
	$FireTimer.start()

func _on_fire_timer_timeout() -> void:
	var bullet := bullet_scene.instantiate()
	bullet.global_transform = global_transform
	get_parent().add_child(bullet)
	$Sprite.texture = disabled_tex
	$SpinTimer.start()
