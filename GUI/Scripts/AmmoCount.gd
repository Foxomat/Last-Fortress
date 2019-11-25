extends Label

onready var old_value = "0"

func _ready():
	$".".text = "0"

func _process(delta):
	var ammo = str(Global.ammo_count)
	
	#refreshes the value (if it changed)
	if old_value != ammo:
		old_value = ammo
		
		# shorten the string, e.g. 12000 -> 12,0K
		ammo = Global.shorten_value(ammo)
			
		$".".text = ammo