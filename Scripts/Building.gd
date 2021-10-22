extends Node2D

export var building_name: String
export var price: int
export var building_label: NodePath
export var unlock_button: NodePath

signal building_unlocked

func _ready() -> void:
	get_node(building_label).text = "%s - %s" % [building_name, _get_price_string()]
	get_node(unlock_button).text = "Unlock"

func _on_unlock_button_pressed() -> void:
	get_node(unlock_button).visible = false
	emit_signal("building_unlocked")

func _get_price_string() -> String:
	if price > 0:
		return str(price)
	else:
		return "free"
