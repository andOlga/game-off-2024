@icon("res://sprite_images/sRoomExit.png")

extends StaticBody2D

@export var goal: GDScript
var is_in_fade := false
var success: bool

func _on_enter_area_body_entered(body: Node2D) -> void:
	if body is Player and not is_in_fade:
		success = goal.new().is_room_complete($/root/Room)
		$FadeRect.show()
		if success:
			$FadeRect.color = Color("00FF00", 0)
			$SuccessSFX.play()
		else:
			$FadeRect.color = Color("FF0000", 0)
			$FailSFX.play()
		$FadeTimer.start()

func _on_fade_timer_timeout() -> void:
	if $FadeRect.color.a < 1:
		$FadeRect.color.a += 0.1
	else:
		RoomRng.go_to_next(success)
