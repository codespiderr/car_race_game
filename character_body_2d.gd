extends CharacterBody2D


var SPEED = 1000.0
var rotate = 180

var released = true
var back_released = true

var press_left = false
var press_right = false
var check1 = false
var check2 = false
var check3 = false
var check4 = false
var direction_to_move 
var laps = 0
func _physics_process(delta: float) -> void:

	direction_to_move = Vector2(cos($".".rotation + PI/2),sin($".".rotation + PI/2)).normalized()
	if Input.is_action_just_pressed("forward"):
		released = false
	elif Input.is_action_just_released("forward"):
		released = true
		
		
	#if velocity.y<0 and released:
		#velocity.y+=400*delta
		#if velocity.y>0:
			#velocity.y = 0
		
	if Input.is_action_just_pressed("back"):
		back_released = false
	elif Input.is_action_just_released("back"):
		back_released = true
		
	if back_released and released :
		velocity = Vector2(0,0)
	elif back_released:
		velocity = -direction_to_move * SPEED * delta * 70
	else:
		velocity = direction_to_move * SPEED * delta * 40
		
	$CPUParticles2D.gravity = -direction_to_move*980
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("ui_end"):
		$".".position = Vector2(300,500)
	
	
	if Input.is_action_just_pressed("left"):

		press_left = true
	elif Input.is_action_just_released("left"):

		press_left = false
	
	if Input.is_action_just_pressed("right"):
		press_right = true
	elif Input.is_action_just_released("right"):
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
