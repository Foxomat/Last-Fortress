extends Label

func _ready():
	get_node("/root/Global").connect("day_change", self, "_on_day_change")
	$".".text = "Day 0"
	

func _on_day_change():
	var day = str(Global.current_day)
	$".".text = "Day " + day
