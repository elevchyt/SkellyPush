extends Label

# General Variables
var active = false

func _on_Timer_timeout():
	# Flash text
	if (active == true):
		if (visible == true):
			visible = false
		else:
			visible = true
