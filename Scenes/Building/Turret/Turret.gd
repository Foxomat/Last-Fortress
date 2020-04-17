extends "res://Scenes/Building/Building.gd"

var FIRING : bool = false

func _ready():
	$"EnemyDetection".cast_to.y = -position.y


func _process(delta):
	#print(FIRING)
	pass


func _Collision_Test():
	if $"EnemyDetection".is_colliding():
		FIRING = true
	else:
		FIRING = false
