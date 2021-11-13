extends Node2D
class_name BaseBuilding

export var building_name: String
export var price: int

export var locked_sprite_node: NodePath
export var unlocked_sprite_node: NodePath

var locked_sprite: Sprite
var unlocked_sprite: Sprite
var unlocked := false

signal not_enough_money
signal building_unlocked

func _ready() -> void:
	# Cache the nodes
	locked_sprite = get_node(locked_sprite_node)
	unlocked_sprite = get_node(unlocked_sprite_node)
	locked_sprite.visible = true
	unlocked_sprite.visible = false

func unlock() -> void:
	if GameManager.money - price < 0:
		emit_signal("not_enough_money")
	elif not unlocked:
		GameManager.money -= price
		emit_signal("building_unlocked")
		unlocked = true
		locked_sprite.visible = false
		unlocked_sprite.visible = true
	pass

func get_price_string() -> String:
	if price > 0:
		return str(price)
	else:
		return "free"
