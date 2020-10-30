extends Area2D

# Player Node
onready var playerNode = get_node("/root/Game/Player")
	
# Move Up
func moveTo(pushDirection):
	$RayCast2D.set_cast_to(pushDirection)
	$RayCast2D.force_raycast_update()
	print("Box dir: " + str($RayCast2D.get_collider()))
	
	# Move if possible
	if ($RayCast2D.get_collider() == null):
		position += pushDirection
		$AudioPush.play()
		
	# Check goal
	elif ($RayCast2D.get_collider().name == "Goal"):
		position += pushDirection
		$RayCast2D.get_collider().get_node("AudioWin").play()
		playerNode.locked = true
		playerNode.get_node("WinLabel").active = true
