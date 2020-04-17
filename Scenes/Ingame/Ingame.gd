extends Node

export (PackedScene) var Collider
export (PackedScene) var BlueGuy

func _input(event):
	var offset = $"IngameCamera".offset
	var pos = event.position
	
	if event is InputEventScreenTouch and event.pressed:
		if pos.y < 1280 - offset.y and pos.x < 888 - offset.x:
			var collider = Collider.instance()
			collider.position = pos + offset
			add_child(collider)


func _on_Spawntimer_timeout():
	var blue_guy = BlueGuy.instance()
	blue_guy.position = Vector2(400, -50)
	$"Enemies".add_child(blue_guy)

