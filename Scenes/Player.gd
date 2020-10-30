extends Area2D

# General Variables
var direction = Vector2.ZERO
var locked = false

func _process(delta):
	if (locked == false):
		## RESTART ##
		if (Input.is_action_just_pressed("key_r") && locked == false):
			locked = true
			$AudioRestart.play()
			yield(get_tree().create_timer(1), "timeout")
			get_tree().reload_current_scene()
			
		## MOVEMENT ##
		# Move Up
		if (Input.is_action_just_pressed("key_w")):
			move(Vector2(0, -16))
			
		# Move Down
		elif (Input.is_action_just_pressed("key_s")):
			move(Vector2(0, 16))
		
		# Move Right
		elif (Input.is_action_just_pressed("key_d")):
			move(Vector2(16, 0))
			
		# Move Left
		elif (Input.is_action_just_pressed("key_a")):
			move(Vector2(-16, 0))

func move(direction):
	# Set direction & check collision
	$RayCast2D.set_cast_to(direction)
	$RayCast2D.force_raycast_update()
	print($RayCast2D.get_collider())
	
	# Move if possible
	if ($RayCast2D.get_collider() == null):
		position += direction
		$AudioMove.play()
		
	# Check Box & push (if possible)
	elif ($RayCast2D.get_collider().get_parent().name == "Boxes"):
		$RayCast2D.get_collider().moveTo(direction)
		
