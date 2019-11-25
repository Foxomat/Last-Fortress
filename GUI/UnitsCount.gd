extends Label

func _ready():
	$".".text = "0"

func _process(delta):
	var units = str(Global.unit_count)
	$".".text = units
