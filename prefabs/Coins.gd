extends RichTextLabel

func _process(delta):
	text = "Coins: " + str(GameManager.money)
