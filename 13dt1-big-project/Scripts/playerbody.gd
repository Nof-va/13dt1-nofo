extends CharacterBody3D

const JUMP_VELOCITY = 4.5
const SPEED = 5
const PUSH = 2
@export var hearts: Control
@export var rotation_speed = 10
@export var camera_smoothing_x = 0.05
@export var camera_smoothing_y = 0.1
@export var camera_smoothing_z = 0.05
@export var player_mesh: CollisionShape3D
@export var camera_controller: Node3D
var menu_pack = preload("res://Scenes/in_game_menu.tscn")
var pause_is = false
var last_direction = Vector3.FORWARD


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("move_left", "move_right", "move_away", "move_toward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		last_direction = direction
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	# Rotate player mesh smoothly towards current facing direction
	player_mesh.rotation.y = lerp_angle(player_mesh.rotation.y, atan2(-last_direction.x, -last_direction.z), delta * rotation_speed)
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody3D:
			var moveable = collision.get_collider()
			var push_direction = -collision.get_normal()
			moveable.apply_central_impulse(push_direction * PUSH)
	
	# Camera follow camera controller's position
	camera_controller.position.x = lerp(camera_controller.position.x, position.x, camera_smoothing_x)
	camera_controller.position.y = lerp(camera_controller.position.y, position.y, camera_smoothing_y)
	camera_controller.position.z = lerp(camera_controller.position.z, position.z, camera_smoothing_z)
	
