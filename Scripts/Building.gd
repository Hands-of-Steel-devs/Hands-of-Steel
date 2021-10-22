extends Node2D
class_name Building

export var building_name: String
export var price: int

export var building_label_node: NodePath
export var unlock_button_node: NodePath
export var locked_sprite_node: NodePath
export var unlocked_sprite_node: NodePath

var unlock_text := "Unlock"
var money_warning := "Not enough money!"
var money_warning_time := 1.0 # May be changed in the future
var building_label
var unlock_button: Button
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
	unlock_button.text = unlock_text
	unlock_button.connect("pressed", self, "_on_unlock_button_pressed")
	
	locked_sprite.visible = true
	unlocked_sprite.visible = false

func _on_unlock_button_pressed() -> void:
	if GameManager.money - price < 0:
		var timer := Timer.new()
		timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
		timer.one_shot = true
		add_child(timer)
		unlock_button.text = money_warning
		unlock_button.disabled = true
		timer.start(money_warning_time)
		yield(timer, "timeout")
		unlock_button.text = unlock_text
		unlock_button.disabled = false
		timer.queue_free()
	else:
		emit_signal("building_unlocked")
		unlock_button.visible = false
		building_label.visible = false
		locked_sprite.visible = false
		unlocked_sprite.visible = true

func _get_price_string() -> String:
	if price > 0:
		return str(price)
	else:
		return "free"
