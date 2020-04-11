extends Area2D

var hit_points = 10
var current_hit_points = hit_points

func _ready():
	get_node("/root/Global").connect("__fence_hp_change", self, "_on_fence_hp_change")
	#DAS HIER MUSS ZUR HP BAR

func _on_Enemy_touching(area):
	area.connect("__do_damage", self, "_on_damage_taken")
	
func _on_damage_taken(value):
	current_hit_points -= value
	
func _process(delta):
	if current_hit_points <= 0:
		if current_hit_points >= -1:
			print("kaputt")
