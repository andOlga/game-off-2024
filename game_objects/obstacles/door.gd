class_name Door extends StaticBody2D

func open() -> void:
	show()
	$Hitbox.set_deferred(&"disabled", false)

func close() -> void:
	hide()
	$Hitbox.set_deferred(&"disabled", true)

func toggle() -> void:
	visible = not visible
	$Hitbox.set_deferred(&"disabled", not $Hitbox.disabled)
