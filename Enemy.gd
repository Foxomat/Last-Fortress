extends KinematicBody2D

var velocity = 200

func ready():
	$AnimatedSprite.animation = "Fly"
	
func _on_Visibility_screen_exited():
	queue_free()
