extends TextureButton

var popup_visible : bool = false


func _pressed():
	$".".disabled = true

func _on_RessourceInfo_popup_hide():
	yield(get_tree().create_timer(0.1),"timeout")
	$".".disabled = false
