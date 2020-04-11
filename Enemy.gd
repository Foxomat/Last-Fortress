extends Area2D

var speed = 100
var current_speed = speed
var hit_points = 3
var current_hit_points = hit_points
var damage = 1
var attacks_per_second = 1

signal __do_damage

func _ready():
	$"DamageTimer".wait_time = attacks_per_second


func _process(delta):
	$".".position.y = $".".position.y + delta*current_speed
	$".".z_index = $".".position.y
	
	if current_hit_points <= 0:
		queue_free()
		
func _on_damage_taken(damage):
	current_hit_points -= damage


func _on_Enemy_area_entered(area):
	if area.collision_layer == 1: # collision with fence
		current_speed = 0
		emit_signal("__do_damage", damage)
		$"DamageTimer".start()
	

func _on_Enemy_area_exited(area):
	if area.collision_layer == 1:
		current_speed = speed
		$"DamageTimer".stop()

func _on_DamageTimer_timeout():
	emit_signal("__do_damage", damage)
