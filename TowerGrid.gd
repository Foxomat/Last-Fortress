extends ItemList

func _ready():
	var texture = ResourceLoader.load("res://assets/Grid_Tile.png")
	
	for i in range(0, (16*6)):
		$".".add_icon_item(texture, true)

func _process(delta):
	if is_anything_selected():
		set_item_icon_modulate($".".get_selected_items()[0], Color(0, 1, 1, 1))
