@icon("res://sprite_images/sPlayer.png")

class_name Player extends CharacterBody2D

var is_hurting := false
var draws_grid := true
var hp := 3
var last_move := Vector2(180, 0)
@onready var has_sword : bool = $"..".has_sword

func update_health_display() -> void:
	var hp_blends := [
		Color("FFA500"), # Orange, hp = 1
		Color("FFFF00"), # Yellow, hp = 2
		Color("008000"), # Green, hp = 3
	]
	$Sprite.modulate = hp_blends[hp - 1]

func hurt() -> void:
	if not is_hurting:
		$HurtSFX.play()
		is_hurting = true
		hp -= 1
		for i in Input.get_connected_joypads().size():
			Input.start_joy_vibration(i, 0.2, 0.2, 1)
		Input.vibrate_handheld(1000)
		if hp <= 0:
			$DeathTimer.start()
			hide()
		else:
			update_health_display()
			$InvisFrameTimer.start()
			$InvisBlinkTimer.start()
			
func enable_swim() -> void: # Turns off water collisions
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	
func enable_sword() -> void: # Gives the player the sword if they didn't have it
	has_sword = true
	%Sword.show()

func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()

func _on_invis_frame_timer_timeout() -> void:
	is_hurting = false
	$InvisBlinkTimer.stop()
	$Sprite.modulate.a = 1

func _on_invis_blink_timer_timeout() -> void:
	if $Sprite.modulate.a == 1:
		$Sprite.modulate.a = 0.5
	else:
		$Sprite.modulate.a = 1

func _ready() -> void:
	update_health_display()
	if not has_sword:
		%Sword.hide()

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down") * 10800 * delta
	if velocity != Vector2.ZERO:
		last_move = velocity
	if has_sword:
		%Sword.rotate_to(last_move)
		if Input.is_action_just_pressed("action_sword"):
			%Sword.fire(last_move * 3)
	move_and_slide()
