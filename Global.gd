extends Node

var unit_count = 0
var money_count = 0
var ammo_count = 0
var explosives_count = 0
var prestiege_count = 0

func _ready():
	yield(get_tree().create_timer(5.0),"timeout")
	unit_count = 100