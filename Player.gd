extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(bool) onready var moveable = true setget set_moveable
export(int) var moveSpeed = 100
export(int) var gravity = 500
export var flipped = false

onready var image = $Child/Image
onready var _scale = self.scale

var velocity = Vector2()

func _physics_process(delta):
	if not moveable:
		return
		
	velocity.y += delta * gravity
	
	if Input.is_key_pressed(KEY_A):
		velocity.x = -moveSpeed
		image.play("Walk")
		
		$Child.scale.x = -1
		flipped = true
		
	elif Input.is_key_pressed(KEY_D):
		velocity.x = moveSpeed
		image.play("Walk")
		
		$Child.scale.x = 1
		flipped = false
	else:
		velocity.x = 0
		image.play("Idle")
	
	move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor():
		velocity.y = 0
		
		#if Input.is_key_pressed(KEY_SPACE):
		#	velocity.y = -jumpHeight
			
	if is_on_ceiling():
		velocity.y = 0
		
func set_moveable(new):
	if not new and image:
		image.play("Idle")
	moveable = new