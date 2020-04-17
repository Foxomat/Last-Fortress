extends Area2D

#declare those in the inherited enemy scenes!
var MAX_SPEED
var current_speed
var MAX_HIT_POINTS
var current_hit_points
var DAMAGE
var ATTACKS_PER_SECOND

signal __do_damage

#-------------------------------------------------------------------------------

func _ready():
	$"DamageTimer".wait_time = ATTACKS_PER_SECOND


func _process(delta):
	position.y = position.y + delta*current_speed
	
	if current_hit_points <= 0:
		queue_free()



func _on_damage_taken(DAMAGE):
	current_hit_points -= DAMAGE


func _on_Enemy_area_entered(area):
	if area.collision_layer == 1: # collision with fence
		current_speed = 0
		emit_signal("__do_damage", DAMAGE)
		$"DamageTimer".start()


func _on_Enemy_area_exited(area):
	if area.collision_layer == 1:
		current_speed = MAX_SPEED
		$"DamageTimer".stop()


func _on_DamageTimer_timeout():
	emit_signal("__do_damage", DAMAGE)
