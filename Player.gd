extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var moveSpeed = 100
export(int) var jumpHeight = 1000
export(int) var gravity = 500

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * gravity
	
	if Input.is_key_pressed(KEY_A):
		velocity.x = -moveSpeed
	elif Input.is_key_pressed(KEY_D):
		velocity.x = moveSpeed
	else:
		velocity.x = 0
	
	move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor():
		velocity.y = 0
		
		if Input.is_key_pressed(KEY_SPACE):
			velocity.y = -jumpHeight
			
	if is_on_ceiling():
		velocity.y = 0