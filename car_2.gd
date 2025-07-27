extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var released = true

var press_left = false
var press_right = false

var direction_to_move 

func _physics_process(delta: float) -> void:

	direction_to_move = Vector2(cos($".".rotation + PI/2),sin($".".rotation + PI/2)).normalized()

	if Input.is_action_just_pressed("forward2"):
		
		released = false
	elif Input.is_action_just_released("forward2"):
		released = true
		
		
	if released:
		velocity = Vector2(0,0)
	else:
		velocity = -direction_to_move * SPEED * delta * 70
	#if velocity.y<0 and released:
		#velocity.y+=400*delta
		#if velocity.y>0:
			#velocity.y = 0
		
	if Input.is_action_just_pressed("back2"):
		velocity = Vector2(0,1) * SPEED
	elif Input.is_action_just_released("back2"):
		velocity = Vector2(0,0)

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
		$".".rotation_degrees -= 180*delta
	else:
		$".".rotation_degrees += 0
		
	if press_right:
		$".".rotation_degrees +=180*delta
	else:
		$".".rotation_degrees += 0
		
	

	move_and_slide()
