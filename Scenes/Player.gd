extends CharacterBody2D

@export var speed: float
@export var angular_speed: float
@export var JUMP_VELOCITY = -400.0


var screen_size
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):

	var next_position : Vector2
	if Input.is_action_pressed("move_forward"):
		next_position = Vector2(speed*delta, 0)
	elif Input.is_action_pressed("move_backward"):
		next_position = Vector2(-speed*delta, 0)
	position = next_position
	
	var angle = Input.get_axis("rotate_anticlockwise","rotate_clockwise")
	if angle:
		rotation += angle * angular_speed
