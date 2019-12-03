extends Label

func _ready():
	get_node("/root/Global").connect("__prestiege_change", self, "_on_prestiege_change")
	$".".text = "0"

func _on_prestiege_change():
	var prestiege = str(Global.get_ressource_count("prestiege"))
	prestiege = Global.shorten_value(prestiege)
	$".".text = prestiege