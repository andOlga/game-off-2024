@icon("res://sprite_images/sFlyer.png")

extends BaseEnemy

@export var can_swim := false

func _ready() -> void:
	if can_swim:
		set_collision_mask_value(2, false)
	randomize_direction()
		
func randomize_direction() -> void:
	rotation_degrees = randi_range(0, 360)
	
func _physics_process(delta: float) -> void:
	velocity = transform.x * 120 * delta
	var collision := move_and_collide(velocity)
	if collision:
		randomize_direction()
