extends Node2D

onready var sprite = $Sprite
onready var button = $Button
onready var sprite_finish = $Sprite_finished
onready var Text = $RichTextLabel

func _ready():
	sprite_finish.visible = false

func _on_Button_pressed():
	sprite.visible = false
	button.visible = false
	Text.visible = false
	sprite_finish.visible = true
