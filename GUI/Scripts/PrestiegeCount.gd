extends Label

onready var old_value = "0"

func _ready():
	$".".text = "0"

func _process(delta):
	var prestiege = str(Global.prestiege_count)
	
	#refreshes the value (if it changed)
	if old_value != prestiege:
		old_value = prestiege
		
		# shorten the string, e.g. 12000 -> 12,0K
		prestiege = Global.shorten_value(prestiege)
			
		$".".text = prestiege