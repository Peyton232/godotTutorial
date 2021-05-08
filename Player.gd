extends KinematicBody2D

var score : float = 0
var speed : int = 200
var jumpForce : int = 600
var gravity : int  = 800
var vel : Vector2 = Vector2()
onready var sprite : Sprite = get_node("sprite")
var collision
# var Score = load("res://scripts/scoreLabel.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	vel.x = 0
	
	# movement inputs left and right
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	# get new velocity to apply to sprite 
	vel = move_and_slide(vel, Vector2.UP)
	
	# get jump input
	vel.y += gravity * delta
	
	
	# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce

	# check which way the sprite needs to face
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
		
	# check if died in hazard
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("hazard"):
			get_tree().reload_current_scene()
		elif collision.collider.is_in_group("coin"):
			collision.collider.queue_free()
			score += 1
			print(score)
