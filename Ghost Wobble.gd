extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
export(float) var timer = 0
func _process(delta):
	timer += delta
	
	position = Vector2(sin(timer) * 3, cos(timer * 1.5) * 3)
	self_modulate.a = sin(timer + 1) * 0.2 + 0.8

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
