extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel : Vector2 = Vector2()
onready var x = vel.x
onready var y = vel.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vel.x = x
	vel.y = y
