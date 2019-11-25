extends Label

onready var old_value = "0"

func _ready():
	$".".text = "0"

func _process(delta):
	var explosives = str(Global.explosives_count)
	
	#refreshes the value (if it changed)
	if old_value != explosives:
		old_value = explosives
		
		# shorten the string, e.g. 12000 -> 12,0K
		explosives = Global.shorten_value(explosives)
			
		$".".text = explosives