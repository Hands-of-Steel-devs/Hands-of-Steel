extends Node2D

onready var sprite = $spr_Props
onready var button = $Button
onready var Text = $RichTextLabel
onready var sprite_finish = $Sprite_finished

func _ready():
	sprite_finish.visible = false


func _on_Button_pressed():
	sprite.visible = false
	button.visible = false
	Text.visible = false
	sprite_finish.visible = true
