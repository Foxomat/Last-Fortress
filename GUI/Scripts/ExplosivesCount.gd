extends Label

func _ready():
	get_node("/root/Global").connect("explosives_change", self, "_on_explosives_change")
	$".".text = "0"

func _on_explosives_change():
	var explosives = str(Global.explosives_count)
	explosives = Global.shorten_value(explosives)
	$".".text = explosives