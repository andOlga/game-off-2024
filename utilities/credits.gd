extends Node2D

func _ready() -> void:
	$CreditsText.text = $CreditsText.text.format(
		{
			"GODOT_VERSION": Engine.get_version_info().string
		}
	)

func _process(delta: float) -> void:
	$CreditsText.position.y -= 60 * delta

func _on_monitor_area_area_exited(_area: Area2D) -> void:
	$TitleTimer.start()

func _on_title_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://utilities/title_screen.tscn")

func _on_credits_text_meta_clicked(meta: Variant) -> void:
	OS.shell_open(meta as String)
