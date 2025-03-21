@icon("res://sprite_images/sItemFrame.png")

extends Node2D

var items : Array[BaseItem] = []
var current_item = 0

func _ready() -> void:
	$CurrentItemSprite.hide()

func add_item(item: BaseItem) -> void:
	items.append(item)
	print(item)

func _process(_delta: float) -> void:
	var size := items.size()
	if size == 0:
		return
	if Input.is_action_just_pressed(&"action_select"):
		current_item += 1
		if current_item > size - 1:
			current_item = 0
		$CurrentItemSprite.texture = items[current_item].get_node("Sprite").texture
		$CurrentItemSprite.show()
		$SpriteHideTimer.start()
	elif Input.is_action_just_pressed(&"action_item"):
		items[current_item].use()


func _on_sprite_hide_timer_timeout() -> void:
	$CurrentItemSprite.hide()
