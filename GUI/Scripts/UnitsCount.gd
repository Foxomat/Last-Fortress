extends Label

onready var old_value = "0"

func _ready():
	$".".text = "0"

func _process(delta):
	var units = str(Global.unit_count)
	
	#refreshes the value (if it changed)
	if old_value != units:
		old_value = units
		
		# shorten the string, e.g. 12000 -> 12,0K
		units = Global.shorten_value(units)
			
		$".".text = units
	
