extends Node2D
class_name Building

export var building_name: String
export var price: int

export var building_label_node: NodePath
export var unlock_button_node: NodePath
export var locked_sprite_node: NodePath
export var unlocked_sprite_node: NodePath

var building_label
var unlock_button
var locked_sprite
var unlocked_sprite

signal building_unlocked

func _ready() -> void:
	building_label = get_node(building_label_node)
	unlock_button = get_node(unlock_button_node)
	locked_sprite = get_node(locked_sprite_node)
	unlocked_sprite = get_node(unlocked_sprite_node)
	
	# TODO: Complain to Godot engine devs about not having lambda functions :)
	building_label.text = "%s - %s" % [building_name, _get_price_string()]
	unlock_button.text = "Unlock"
	unlock_button.connect("pressed", self, "_on_unlock_button_pressed")
	
	locked_sprite.visible = true
	unlocked_sprite.visible = false

func _on_unlock_button_pressed() -> void:
	unlock_button.visible = false
	building_label.visible = false
	emit_signal("building_unlocked")
	
	locked_sprite.visible = false
	unlocked_sprite.visible = true

func _get_price_string() -> String:
	if price > 0:
		return str(price)
	else:
		return "free"
