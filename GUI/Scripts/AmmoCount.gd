extends Label

func _ready():
	get_node("/root/Global").connect("__ammo_change", self, "_on_ammo_change")
	$".".text = "0"

func _on_ammo_change():
	var ammo = str(Global.get_ressource_count("ammo"))
	ammo = Global.shorten_value(ammo)
	$".".text = ammo
