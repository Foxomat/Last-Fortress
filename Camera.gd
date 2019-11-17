extends Camera2D

func _input(event: InputEvent) -> void:
     if event is InputEventScreenDrag:
           $".".offset -= event.relative



