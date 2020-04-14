extends Area2D

var hit_points = 10
var current_hit_points = hit_points

signal __hp_change

#-------------------------------------------------------------------------------

func _ready():
	var hp_bar = get_node("/root/Ingame/GUI Layer/GUI/Fence HP")
	connect("__hp_change", hp_bar, "_on_hp_change")


func _on_Enemy_touching(area):
	area.connect("__do_damage", self, "_on_damage_taken")


func _on_damage_taken(value):
	current_hit_points -= value
	emit_signal("__hp_change", current_hit_points)


func _process(delta):
	if current_hit_points <= 0:
		if current_hit_points >= -2:
			queue_free()
			print("kaputt")
