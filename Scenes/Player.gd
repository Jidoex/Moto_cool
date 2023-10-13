extends CharacterBody2D

@export var speed: float = 10_000
@export var angular_speed: float = 3
@export var deceleration_factor: float = 10

var screen_size
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	drive(delta)
	flip(delta)
	move_and_slide()
	
func drive(delta):
	var direction = Input.get_axis("move_backward","move_forward")
	if direction:
		velocity = Vector2(direction * speed * delta, 0)
	elif velocity.x != 0:
		velocity = Vector2(move_toward(velocity.x, 0, deceleration_factor), velocity.y)
		
func flip(delta):
	var rotation_direction = Input.get_axis("rotate_anticlockwise","rotate_clockwise")
	if rotation_direction:
		rotate(rotation_direction * angular_speed * delta)
