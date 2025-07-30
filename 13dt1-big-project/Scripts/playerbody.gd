extends CharacterBody3D

@export var something: Node
var speed = 5
const JUMP_VELOCITY = 4.5
var menu_pack = preload("res://Scenes/in_game_menu.tscn")
var pause_is = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	
	
	var menu = menu_pack.instantiate()
	var tree = get_tree()

	if Input.is_action_just_pressed("pause"):
		if pause_is == false:
			get_parent().get_parent().add_child(menu)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			tree.paused = !tree.paused
			pause_is = true
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		speed = 5
	
	if Input.is_action_just_pressed("run") and is_on_floor():
		speed += 5
	
	if Input.is_action_just_released("run"):
		speed -= 5

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_away", "move_toward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
	
	#Camera controller follow player_body position but not on z axis
	$controller.position.x = lerp($controller.position.x, position.x, 0.05)
	$controller.position.y = lerp($controller.position.y, position.y, 0.1)
	
