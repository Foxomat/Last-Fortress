extends Area2D

signal __do_damage

export var damage = 1
var used : bool = 0

func _ready():
	$"Timer".start()



func _on_Enemy_Detected(area):
	if not used:
		used = 1
		var colliding_enemies = get_overlapping_areas()
		connect("__do_damage", colliding_enemies[0], "_on_damage_taken")
		emit_signal("__do_damage", damage)
		queue_free()

	
func _on_Timer_timeout():
	queue_free()
