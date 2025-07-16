extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var array_lives : Array[TextureRect]

func _ready() -> void:
	var parent_lives = $"../lives_hud/HBoxContainer"
	for child in parent_lives.get_children():
		array_lives.append(child)


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_away", "move_toward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	#Camera controller follow player_body position but not on z axis
	$controller.position.x = lerp($controller.position.x, position.x, 0.05)
	$controller.position.y = lerp($controller.position.y, position.y, 0.1)

func _on_area_3d_body_entered(_body: Node3D) -> void:
	if Countlives.lives > 0:
		Countlives.lives -= 1
	if Countlives.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		Countlives.lives = 3
	
	print(Countlives.lives)
	print(array_lives)
