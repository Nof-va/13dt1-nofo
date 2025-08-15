extends CharacterBody3D

@export var hud_hearts : Node
@export var speed : int
@export var push_force : int
@export var rotation_speed : int
@export var xcamera_speed : int
@export var ycamera_speed : int
var last_direction = Vector3.FORWARD
const JUMP_VELOCITY = 4.5


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("move_left", "move_right", "move_away", "move_toward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		last_direction = direction
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	# Rotate player's mesh and raycast towards current / last player direction
	$Body.rotation.y = lerp_angle($Body.rotation.y, atan2(-last_direction.x, -last_direction.z), delta * rotation_speed)
	
	move_and_slide()
	
	# Applying force unto moveable objects of Rigidbody3D
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody3D:
			var moveable = collision.get_collider()
			var push_direction = -collision.get_normal()
			moveable.apply_central_impulse(push_direction * push_force)
	
	#Camera controller follow player_body position but not on z axis
	$controller.position.x = lerp($controller.position.x, position.x, xcamera_speed)
	$controller.position.y = lerp($controller.position.y, position.y, ycamera_speed)
	
