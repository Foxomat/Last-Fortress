extends TextureProgress

func _ready():
	yield(get_tree().create_timer(0.2),"timeout")
	var fence = $"/root/Ingame/Fence"
	max_value = fence.hit_points
	value = fence.current_hit_points


func _on_hp_change(new_value):
	value = new_value
