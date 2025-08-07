extends CharacterBody2D


var SPEED = 1000.0
var rotate = 180

var released = true
var back_released = true

var press_left = false
var press_right = false
var laps = 0
var direction_to_move 
var check1 = false
var check2 = false
var check3 = false
var check4 = false
func _physics_process(delta: float) -> void:

	direction_to_move = Vector2(cos($".".rotation + PI/2),sin($".".rotation + PI/2)).normalized()
	if Input.is_action_just_pressed("forward2"):
		released = false
	elif Input.is_action_just_released("forward2"):
		released = true
		

	#if velocity.y<0 and released:
		#velocity.y+=400*delta
		#if velocity.y>0:
			#velocity.y = 0
		
	if Input.is_action_just_pressed("back2"):
		back_released = false
	elif Input.is_action_just_released("back2"):
		back_released = true
		
	if back_released and released :
		velocity = Vector2(0,0)
	elif back_released:
		velocity = -direction_to_move * SPEED * delta * 70
	else:
		velocity = direction_to_move * SPEED * delta * 40
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("ui_end"):
		$".".position = Vector2(600,500)
	
	
	if Input.is_action_just_pressed("left2"):

		press_left = true
	elif Input.is_action_just_released("left2"):

		press_left = false
	
	if Input.is_action_just_pressed("right2"):
		press_right = true
	elif Input.is_action_just_released("right2"):
		press_right = false
		
	if press_left:
		if !released:
			$".".rotation_degrees -= rotate*delta
		elif !back_released:
			$".".rotation_degrees += rotate*delta
	else:
		$".".rotation_degrees += 0
		
	if press_right:
		if !released:
			$".".rotation_degrees +=rotate*delta
		elif !back_released:
			$".".rotation_degrees -= rotate*delta
	else:
		$".".rotation_degrees += 0
		
	

	move_and_slide()
