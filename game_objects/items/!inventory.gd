@icon("res://sprite_images/sItemFrame.png")

extends Node2D

var items : Array[BaseItem] = []
var item_size := 0
var current_item := 0

func _ready() -> void:
	$CurrentItemSprite.hide()

func add_item(item: BaseItem) -> void:
	items.append(item)
	item_size += 1
	current_item = item_size - 1
	_flash_current_item()

func _flash_current_item() -> void:
	$CurrentItemSprite.texture = items[current_item].get_node("Sprite").texture
	$CurrentItemSprite.show()
	$SpriteHideTimer.start()

func _process(_delta: float) -> void:
	if item_size == 0:
		return
	if Input.is_action_just_pressed(&"action_select"):
		current_item += 1
		if current_item > item_size - 1:
			current_item = 0
		_flash_current_item()
	elif Input.is_action_just_pressed(&"action_item"):
		items[current_item].use()

func _on_sprite_hide_timer_timeout() -> void:
	$CurrentItemSprite.hide()
