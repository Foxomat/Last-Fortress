extends Label

func _ready():
	get_node("/root/Global").connect("prestiege_change", self, "_on_prestiege_change")
	$".".text = "0"

func _on_prestiege_change():
	var prestiege = str(Global.prestiege_count)
	prestiege = Global.shorten_value(prestiege)
	$".".text = prestiege