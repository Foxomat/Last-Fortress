extends Label


func _ready():
	get_node("/root/Global").connect("money_change", self, "_on_money_change")
	$".".text = "0"

func _on_money_change():
	var money = str(Global.money_count)
	money = Global.shorten_value(money)
	$".".text = money