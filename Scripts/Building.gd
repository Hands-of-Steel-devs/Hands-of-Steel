extends Node2D
class_name Building

export var building_name: String
export var price: int
export var building_label: NodePath
export var unlock_button: NodePath

export var locked_sprite: NodePath
export var unlocked_sprite: NodePath

signal building_unlocked

func _ready() -> void:
	# TODO: Complain to Godot engine devs about not having lambda functions :)
	get_node(building_label).text = "%s - %s" % [building_name, _get_price_string()]
	get_node(unlock_button).text = "Unlock"
	
	get_node(locked_sprite).visible = true
	get_node(unlocked_sprite).visible = false

func _on_unlock_button_pressed() -> void:
	get_node(unlock_button).visible = false
	emit_signal("building_unlocked")
	
	get_node(locked_sprite).visible = false
	get_node(unlocked_sprite).visible = true

func _get_price_string() -> String:
	if price > 0:
		return str(price)
	else:
		return "free"
