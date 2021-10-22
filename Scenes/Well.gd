extends Building

func _ready():
	connect("building_unlocked", self, "_on_building_unlocked")

func _on_building_unlocked():
	var timer = Timer.new()
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.connect("timeout", self, "_print_money")
	add_child(timer)
	_print_money()
	timer.start(10)

func _print_money():
	GameManager.money =+ 1
