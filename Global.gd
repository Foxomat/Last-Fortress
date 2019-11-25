extends Node

var unit_count = 0
var money_count = 0
var ammo_count = 0
var explosives_count = 0
var prestiege_count = 0

func _ready():
	yield(get_tree().create_timer(1.5),"timeout")
	unit_count = 12
	yield(get_tree().create_timer(0.1),"timeout")
	money_count = 128412798
	yield(get_tree().create_timer(0.1),"timeout")
	ammo_count = 72164721839392
	yield(get_tree().create_timer(0.1),"timeout")
	explosives_count = 1320
	yield(get_tree().create_timer(0.1),"timeout")
	prestiege_count = 764090



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