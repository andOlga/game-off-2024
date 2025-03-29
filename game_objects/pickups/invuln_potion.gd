@icon("res://sprite_images/sPotionInvuln.png")

extends BasePickup

@export var duration_seconds := 10.0
var stored_activator : Player

func _ready() -> void:
	$InvulnTimer.wait_time = duration_seconds

func activate(activator: Player) -> void:
	activator.is_invuln = true
	activator.get_node("InvisBlinkTimer").start()
	stored_activator = activator
	$InvulnTimer.start()

func _on_pickup_sfx_finished() -> void:
	pass # Do not instantly destroy this pickup

func _on_invuln_timer_timeout() -> void:
	stored_activator.is_invuln = false
	stored_activator.get_node("InvisBlinkTimer").stop()
	stored_activator.get_node("Sprite").modulate.a = 1
	stored_activator.update_health_display()
	queue_free()
