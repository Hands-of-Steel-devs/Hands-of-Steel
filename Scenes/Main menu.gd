extends VBoxContainer

onready var Start = $Start
onready var Quit = $Quit

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

func _on_Continue_pressed():
	pass

func _on_Quit_pressed():
	get_tree().quit()

