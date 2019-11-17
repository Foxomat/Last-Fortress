extends ItemList

func _ready():
	var texture = ResourceLoader.load("res://assets/placeholder/icon148.png")
	
	for i in range(0, 64):
		$".".add_item("", texture, true)
