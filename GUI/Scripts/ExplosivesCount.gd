extends Label

func _ready():
	get_node("/root/Global").connect("__explosives_change", self, "_on_explosives_change")
	$".".text = "0"

func _on_explosives_change():
	var explosives = str(Global.get_ressource_count("explosives"))
	explosives = Global.shorten_value(explosives)
	$".".text = explosives