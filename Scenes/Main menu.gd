extends VBoxContainer

onready var Start = $Start
onready var Quit = $Quit


func _ready():
	Start.connect("pressed", self, "_button_pressed")
	add_child(Start)
	
	Quit.connect("pressed", self, "_button_pressed_quit")
	add_child(Quit)

func _button_pressed():
	Start.visible = false
	Quit.visible = false
	
func _button_pressed_quit():
	get_tree().quit()
	
	
	


