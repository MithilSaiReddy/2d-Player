extends KinematicBody2D


export var gravity = 100
export var jump_force = 500
export var player_speed = 500
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	
	
	#Movement
	if Input.is_action_pressed("Left"):
		velocity.x = -player_speed 
		$Sprite.flip_h = true
	elif Input.is_actions_pressed("Right"):
		velocity.x = player_speed
		$Sprite.flip_h = false
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)

	
	#Jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -jump_force
		#print("jump")
	
	
	#Gravity
	velocity.y += gravity * delta
	 
	move_and_slide(velocity, Vector2.UP)
