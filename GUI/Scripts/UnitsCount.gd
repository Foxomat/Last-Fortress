extends Label


func _ready():
	get_node("/root/Global").connect("unit_change", self, "_on_unit_change")
	$".".text = "0"

func _on_unit_change():
	var units = str(Global.unit_count)
	units = Global.shorten_value(units)
	$".".text = units
	
