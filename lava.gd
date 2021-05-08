extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_meta("type", "hazard") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
