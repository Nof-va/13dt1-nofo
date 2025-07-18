extends Area3D

var checkpoint_manager
var player
var lives_list

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Countlives.lives = 3
	var lives_parents = $HudHearts/HBoxContainer
	for child in lives_parents.get_children():
		lives_list.append(child)
	
	print(lives_list)
	
	player = get_parent().get_node("Player")
	checkpoint_manager = get_parent().get_node("CheckpointManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Countlives.lives > 0:
		kill_player()
	if body.is_in_group("Player") and Countlives.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		Countlives.lives = 3
	
	print(Countlives.lives)

func kill_player():
	Countlives.lives -= 1
	player.position = checkpoint_manager.spawn_point
	
