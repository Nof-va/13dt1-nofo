extends Area3D

var checkpoint_manager
var player
var array_lives : Array[TextureRect]
var parent_lives

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Countlives.lives = 3
	parent_lives = get_parent().get_node("HudHearts").get_node("HBoxContainer")
	for child in parent_lives.get_children():
		array_lives.append(child)
	player = get_parent().get_node("Player")
	checkpoint_manager = get_parent().get_node("Checkpoint")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Countlives.lives > 0:
		Countlives.lives -= 1
	if body.is_in_group("Player") and Countlives.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		Countlives.lives = 3
	
	print(Countlives.lives)
	print(array_lives)
	kill_player()

func kill_player():
	pass
