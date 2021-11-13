extends BaseBuilding
class_name Building

export var building_label_node: NodePath
export var unlock_button_node: NodePath

var building_label
var unlock_button

const unlock_text := "Unlock"
const not_enough_money_text := "Not enough money!"

func _ready() -> void:
	building_label = get_node(building_label_node)
	unlock_button = get_node(unlock_button_node)
	building_label.text = "%s - %s" % [building_name, get_price_string()]
	unlock_button.text = unlock_text
	unlock_button.connect("pressed", self, "unlock")
	
	connect("building_unlocked", self, "_on_building_unlocked")
	connect("not_enough_money", self, "_on_not_enough_money")

func _on_building_unlocked() -> void:
	unlock_button.queue_free()
	building_label.queue_free()

func _on_not_enough_money() -> void:
	var timer := Timer.new()
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.one_shot = true
	add_child(timer)
	unlock_button.text = not_enough_money_text
	unlock_button.disabled = true
	timer.start(1)
	yield(timer, "timeout")
	unlock_button.text = unlock_text
	unlock_button.disabled = false
	timer.queue_free()
