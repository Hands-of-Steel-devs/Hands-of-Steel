extends VBoxContainer

onready var Start = $Start
onready var Quit = $Quit
# @YesImBadProgrammer: where's this audio player?
# onready var Song = $AudioStreamPlayer2D

func _on_Start_pressed():
	get_tree().change_scene("res://scenes/world.tscn")

func _on_Continue_pressed():
	pass

func _on_Quit_pressed():
	get_tree().quit()
	
