extends Node

var money_count = 0
signal money_change
var unit_count = 0
signal unit_change
var ammo_count = 0
signal ammo_change
var explosives_count = 0
signal explosives_change
var prestiege_count = 0
signal prestiege_change

var current_day = 0
signal day_change

func _ready():
	yield(get_tree().create_timer(1.5),"timeout")
	money_count = 128412798
	emit_signal("money_change")
	
	yield(get_tree().create_timer(0.1),"timeout")
	unit_count = 12
	emit_signal("unit_change")
	
	yield(get_tree().create_timer(0.1),"timeout")
	ammo_count = 72164721839392
	emit_signal("ammo_change")
	
	yield(get_tree().create_timer(0.1),"timeout")
	explosives_count = 1320
	emit_signal("explosives_change")
	
	yield(get_tree().create_timer(0.1),"timeout")
	prestiege_count = 764090
	emit_signal("prestiege_change")
	
	yield(get_tree().create_timer(0.1),"timeout")
	current_day = 42
	emit_signal("day_change")


func shorten_value(value: String) -> String:
	"""
	This function converts a number that is given as a string into another shorter String.
	For example 29387 gets shortened (and rounded) to 29,3K; or 803000000 -> 803M.
	Useful for displays where the text shouldn't get too big.
	"""
	var length = len(value) 
	match length:
		1, 2, 3: pass
		4, 5: value = value.left(length - 3) + "," + value.substr(length - 3, 1) + "K"
		6: value = value.left(length - 3) + "K"
		7, 8: value = value.left(length - 6) + "," + value.substr(length - 6, 1) + "M"
		9: value = value.left(length - 6) + "M"
		_: value = value.left(1) + "xE" + str(length-1)
	return value