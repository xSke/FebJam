extends StaticBody2D

var closed = preload("res://Assets/Art/Export/Furniture/Door_1.png")
var open = preload("res://Assets/Art/Export/Furniture/Door_2.png")

var hasOpened = false

func _ready():
	$Interactable.connect("interacted", self, "_i")

func _process():
	$Interactable.interactable = Vars.hasKey and not hasOpened

func _i():
	if hasOpened:
		return
		
	$"Door Sprite".texture = open
	$CollisionPolygon2D.disabled = true
	
	hasOpened = true