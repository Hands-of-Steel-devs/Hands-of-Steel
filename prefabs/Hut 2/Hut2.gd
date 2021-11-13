extends Building

onready var wow = $wow 
onready var waw = $waw

func _ready() -> void:
	connect("building_unlocked", self, "_on_hut2_unlocked")
	pass

func _on_hut2_unlocked() -> void:
	wow.visible = true
	waw.visible = true
