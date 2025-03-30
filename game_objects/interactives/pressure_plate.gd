@icon("res://sprite_images/sPressurePlateOn.png")

class_name PressurePlate extends Node2D

signal toggled(new_state: bool)

const tex_on := preload("res://sprite_images/sPressurePlateOn.png")
const tex_off := preload("res://sprite_images/sPressurePlateOff.png")

@export var stays_on := false
var pressed := false

func toggle_state():
	pressed = not pressed
	if pressed:
		$Sprite.texture = tex_on
		$OnSFX.play()
	else:
		$Sprite.texture = tex_off
		$OffSFX.play()
	toggled.emit(pressed)

func _on_hitbox_interacted(body: Node2D) -> void:
	if pressed and stays_on:
		return
	if body is Player or body is GloveBox:
		toggle_state()
