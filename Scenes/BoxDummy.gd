extends Area2D

# Move Up
func moveTo(pushDirection):
	$RayCast2D.set_cast_to(pushDirection)
	$RayCast2D.force_raycast_update()
	print("Box dir: " + str($RayCast2D.get_collider()))
	
	# Move if possible
	if ($RayCast2D.get_collider() == null):
		position += pushDirection
		$AudioPush.play()
