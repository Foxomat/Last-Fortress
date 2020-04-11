extends Node

var __money_count = 0
signal __money_change
var __unit_count = 0
signal __unit_change
var __ammo_count = 0
signal __ammo_change
var __explosives_count = 0
signal __explosives_change
var __prestiege_count = 0
signal __prestiege_change

var __current_day = 0
signal __day_change



#-----------------------------------------------------Functions--------------------------------------------------------------

func _ready():
	yield(get_tree().create_timer(1.5),"timeout")
	set_ressource_count("money", 128412798)
	
	yield(get_tree().create_timer(0.1),"timeout")
	set_ressource_count("units", 12)
	
	yield(get_tree().create_timer(0.1),"timeout")
	set_ressource_count("ammo", 72164721839392)
	
	yield(get_tree().create_timer(0.1),"timeout")
	set_ressource_count("explosives", 1320)
	
	yield(get_tree().create_timer(0.1),"timeout")
	set_ressource_count("prestiege", 764090)
	
	yield(get_tree().create_timer(0.1),"timeout")
	add_current_day(42)



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


#-----------------------------------------------getter--setter--adder-------------------------------------------------------

#getter and setter (and adder) for the ressources
func get_ressource_count(ressource: String):
	match ressource:
		"money": return __money_count
		"units": return __unit_count
		"ammo": return __ammo_count
		"explosives": return __explosives_count
		"prestiege": return __prestiege_count
		_: return "invalid"

func set_ressource_count(ressource: String, value: int):
	match ressource:
		"money": 
			__money_count = value
			emit_signal("__money_change")
		"units":
			__unit_count = value
			emit_signal("__unit_change")
		"ammo":
			__ammo_count = value
			emit_signal("__ammo_change")
		"explosives":
			__explosives_count = value
			emit_signal("__explosives_change")
		"prestiege":
			__prestiege_count = value
			emit_signal("__prestiege_change")
		_: return "invalid"

func add_ressource_count(ressource: String, value: int):
	match ressource:
		"money":
			__money_count += value
			emit_signal("__money_change")
		"units":
			__unit_count += value
			emit_signal("__unit_change")
		"ammo":
			__ammo_count += value
			emit_signal("__ammo_change")
		"explosives":
			__explosives_count += value
			emit_signal("__explosives_change")
		"prestiege":
			__prestiege_count += value
			emit_signal("__prestiege_change")
		_: return "invalid"


func get_current_day():
	return __current_day
	
func set_current_day(value: int):
	__current_day = value
	emit_signal("__day_change")
	
func add_current_day(value: int):
	__current_day += value
	emit_signal("__day_change")
