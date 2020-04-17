extends "res://Scenes/Enemy/Enemy.gd"

func _init():
	MAX_SPEED = 100
	current_speed = MAX_SPEED
	MAX_HIT_POINTS = 3
	current_hit_points = MAX_HIT_POINTS
	DAMAGE = 1
	ATTACKS_PER_SECOND = 1
