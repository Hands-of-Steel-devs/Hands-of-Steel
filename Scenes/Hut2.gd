extends Node2D

onready var Sprite_finish = $Sprite_finished
onready var Sprite = $Sprite
onready var RichTextLabel = $RichTextLabel
onready var wow = $wow 
onready var waw = $waw

func _on_Button_pressed():
	if GameManager.money > 10:
		GameManager.money - 10
		Sprite.visible = false
		RichTextLabel.visible = false
		Sprite_finish.visible = true
		wow.visible = true
		waw.visible = true
