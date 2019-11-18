extends Camera2D

onready var camera = $"."
var max_downscroll = 16*148 - 640

func _input(event: InputEvent):
	if event is InputEventScreenDrag:
		camera.offset.y = max(   min(camera.offset.y - event.relative.y, max_downscroll),   0)
		#compressed version of:
		#camera.offset.y = camera.offset.y - event.relative.y  	#compute swipe camera drag
		#camera.offset.y = max(camera.offset.y, 0)				#upper drag limit
		#camera.offset.y = min(camera.offset.y, max_downscroll)	#lower drag limit

