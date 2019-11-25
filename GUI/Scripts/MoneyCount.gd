extends Label

onready var old_value = "0"

func _ready():
	$".".text = "0"

func _process(delta):
	var money = str(Global.money_count)
	
	#refreshes the value (if it changed)
	if old_value != money:
		old_value = money
		
		# shorten the string, e.g. 12000 -> 12,0K
		money = Global.shorten_value(money)
			
		$".".text = money